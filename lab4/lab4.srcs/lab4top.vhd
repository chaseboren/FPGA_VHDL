library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;
--Requires pulse_generator_small, pulse_generator seg7_controller, seg7_hex,
--upCounter, btnDebounce.
--implements a VGA display driver with a blue-green checkeboard and with a moving red cursor.
--The use of GENERIC for integer cosntants and their expression in the process was significantly influenced by
--a 1920x1080 vga_conntroller design by Scott Larson for Digi-key,
--available at https://eewiki.net/download/attachments/15925278/vga_controller.vhd?version=2&modificationDate=1520463067550&api=v2
entity lab4_top is
  generic(h_pulse  : integer := 96;
          h_bp     : integer := 48;
          h_pixels : integer := 640;
          h_fp     : integer := 16;

          v_pulse  : integer := 2;
          v_bp     : integer := 29;
          v_pixels : integer := 480;
          v_fp     : integer := 10);
  port (CLK100MHZ : in std_logic;

        SW  : in  std_logic;
        LED : out std_logic;

        BTNU : in std_logic;
        BTND : in std_logic;
        BTNL : in std_logic;
        BTNR : in std_logic;

        VGA_R : out std_logic_vector (3 downto 0);
        VGA_G : out std_logic_vector (3 downto 0);
        VGA_B : out std_logic_vector (3 downto 0);

        VGA_HS    : out std_logic;
        VGA_VS    : out std_logic;
        SEG7_CATH : out std_logic_vector (7 downto 0);
        AN        : out std_logic_vector (7 downto 0));
end lab4_top;

architecture Behavioral of lab4_top is
  signal btnDBU    : std_logic;
  signal btnDBD    : std_logic;
  signal btnDBL    : std_logic;
  signal btnDBR    : std_logic;
  signal btnDBRint : std_logic;
  signal btnDBLint : std_logic;
  signal btnDBUint : std_logic;
  signal btnDBDint : std_logic;

  constant twentyfivemhzmaxCount : unsigned (1 downto 0) := "11";
  signal en25                    : std_logic;

  signal horizontal_counter       : unsigned (9 downto 0);
  signal vertical_counter         : unsigned (9 downto 0);
  signal horizontal_counter_reset : std_logic;

  --cursor positions
  signal xpos   : unsigned (7 downto 0) := x"00";
  signal ypos   : unsigned (7 downto 0) := x"00";
  --current checkerboard of the draw
  signal xframe : unsigned (7 downto 0) := x"00";
  signal yframe : unsigned (7 downto 0) := x"00";

  signal vga_ARGB         : std_logic_vector (3 downto 0);  -- used to drive a mux for deciding on the color
  signal vga_REDGREENBLUE : std_logic_vector (11 downto 0);
  --the checkerboard variables flip every 32 bits. Uses mux to pick green or blue.
  signal xcheckerboard    : std_logic := '0';
  signal ycheckerboard    : std_logic := '0';

  signal clk   : std_logic;
  signal reset : std_logic;
  signal q0    : std_logic_vector (3 downto 0);--for seg 7 controller for LEDs. the other register are fed zeroes.
  signal q2    : std_logic_vector (3 downto 0);
  signal q3    : std_logic_vector (3 downto 0);
  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);  --controls digit displayed.

  constant displayzero : std_logic_vector (3 downto 0) := "0000";  --used for five of the eight digits

  constant h_period : integer := h_pulse + h_bp + h_pixels + h_fp;
  constant v_period : integer := v_pulse + v_bp + v_pixels + v_fp;
  signal vga_A      : std_logic;
  signal vga_RED    : std_logic;
  signal vga_GREEN  : std_logic;
  signal vga_BLUE   : std_logic;

begin
  btnDebounce_U : entity btnDebounce
    port map (
      clk   => CLK100MHZ,
      btn   => BTNU,
      btnDB => btnDBU
      );
  btnDebounce_L : entity btnDebounce
    port map (
      clk   => CLK100MHZ,
      btn   => BTNL,
      btnDB => btnDBL
      );
  btnDebounce_D : entity btnDebounce
    port map (
      clk   => CLK100MHZ,
      btn   => BTND,
      btnDB => btnDBD
      );
  btnDebounce_R : entity btnDebounce
    port map (
      clk   => CLK100MHZ,
      btn   => BTNR,
      btnDB => btnDBR
      );
  pulse_generator_small_0 : entity pulse_generator_small
    port map (
      clk      => CLK100MHZ,
      reset    => reset,
      maxCount => twentyfivemhzmaxCount,
      pulseOut => en25
      );
--  vertical_upCounter_0 : entity vertical_upCounter Leftover from unused attempt.
  --  port map (
  --    clk     => CLK100MHZ,
  --    reset   => reset,
  --    en      => horizontal_counter_reset,
  --    counter => vertical_counter
  --    );
--  horizontal_upCounter_0 : entity horizontal_upCounter
--    port map (
--      clk     => CLK100MHZ,
  --    reset   => reset,
  --  en      => en25,
  --  counter => horizontal_counter,
  --  dsen    => horizontal_counter_reset
  --  );
  seg7_controller_0 : entity seg7_controller
    port map (
      clk   => CLK100MHZ,
      reset => reset,
      q0    => q0,
      q1    => displayzero,
      q2    => q2,
      q3    => q3,
      q4    => displayzero,
      q5    => displayzero,
      q6    => displayzero,
      q7    => displayzero,
      anode => anode,
      seg7  => seg7
      );



  process(clk, reset)
    variable xpix_counter : unsigned (4 downto 0)          := "00000";
    variable ypix_counter : unsigned (4 downto 0)          := "00000";
    variable h_count      : integer range 0 to h_period -1 := 0;
    variable v_count      : integer range 0 to v_period -1 := 0;
  begin
    --synchronization
    --if (rising_edge(clk)) then
    --  if horizontal_counter = "0000000000" then
    --    horizontal_counter_reset <= '1';
    --  else
    --    horizontal_counter_reset <= '0';
    --    end if;
    --  end if;
    -- Button counts

    if rising_edge(clk) then
      if en25 = '1' then
        if h_count < h_period - 1 then
          h_count    := h_count + 1;
          if h_count <= h_pixels then --deviation from the vga_controller by Scott Larson. Corrected some "side-scrolling" issue by setting <= vice <
            xpix_counter := xpix_counter + 1;  --cheating some what  and letting it wraparound since unsigned.
            if xpix_counter = "00000" then --increment sqyare
              xframe        <= xframe + 1; --used in deciding which "square" the draw is in
              xcheckerboard <= not xcheckerboard; -- used to drive blue-green logic.
            end if;
--          else  not needed due to going equal to in h_count <= h_pixels.
--            xpix_counter := "00000";
          end if;
        else
          h_count := 0;
          xframe  <= x"00";
          if v_count < v_period - 1 then
            v_count := v_count + 1;
            if v_count < v_pixels then
              ypix_counter := ypix_counter + 1;  --cheating some what  and letting it wraparound since unsigned.
              if ypix_counter = "00000" then --resets every new square.
                yframe        <= yframe + 1;  --used in deciding which square the draw is in
                ycheckerboard <= not ycheckerboard; --used to drive the blue green logic.
              end if;
            else
              ypix_counter := "00000";
            end if;
          else
            v_count := 0;
            yframe  <= x"00";
          end if;
        end if;
        if h_count < h_pixels + h_fp or h_count >= h_pixels + h_fp + h_pulse then
          VGA_HS <= '0';
        else
          VGA_HS <= '1';
        end if;
        if v_count < v_pixels + v_fp or v_count >= v_pixels + v_fp + v_pulse then
          VGA_VS <= '0';
        else
          VGA_VS <= '1';
        end if;
        if v_count < v_pixels and h_count < h_pixels then
          vga_A <= '1';
        else
          vga_A <= '0';
        end if;

        if btnDBU = '1' then
          if ypos /= x"00" then         --helps to map to torus
            ypos <= ypos - 1;
          else
            ypos <= x"0E";
          end if;
        end if;
        if btnDBD = '1' then
          if ypos < x"0E" then          --helps to map to torus
            ypos <= ypos + 1;
          else
            ypos <= x"00";
          end if;
        end if;


        if btnDBR = '1' then
          if xpos < x"13" then          --helps to map to torus
            xpos <= xpos + 1;
          else
            xpos <= x"00";
          end if;
        end if;
        if btnDBL = '1' then
          if xpos /= x"00" then         --helps to map to torus
            xpos <= xpos - 1;
          else
            xpos <= x"13";
          end if;
        end if;
      end if;
      if reset = '1' then --resets cursor position. Has to be outside enable block because en25 is disabled during reest.
        xpos <= x"00";
        ypos <= x"00";
      end if;
    end if;

  end process;
  vga_ARGB <= (vga_A & vga_RED & vga_GREEN & vga_BLUE);
  with vga_ARGB select  --four bit mux to draw red green or blue tiles. A is for active.
    -- I could have been much simpler but was pretty far down this path when I realized
    -- I also had to draw black. R = 1 means the cursor is here. GB 11 or 00 is green, rest are blue
    vga_REDGREENBLUE <=
    x"F00" when "1100",
    x"F00" when "1101",
    x"F00" when "1111",
    x"F00" when "1110",
    x"0F0" when "1011",
    x"0F0" when "1000",
    x"00F" when "1010",
    x"00F" when "1001",
    x"000" when others;     --paint it black

  VGA_R <= vga_REDGREENBLUE (11 downto 8);
  VGA_G <= vga_REDGREENBLUE (7 downto 4);
  VGA_B <= vga_REDGREENBLUE (3 downto 0);

-- artifacts from unsuccessful attempts
--    VGA_R <= (vga_A & vga_A & vga_A & vga_A) and "1111";
--  VGA_G <= (vga_A & vga_A & vga_A & vga_A) and"1111";
--  VGA_B <= (vga_A & vga_A & vga_A & vga_A) and "1111";
--
--VGA_HS <= '1' when (horizontal_counter > "1010010000") and (horizontal_counter < "1011110000") else '0'; --656 and 752 respectively
--VGA_VS <= '1' when (vertical_counter > "0111101010") and (vertical_counter < "0111101010") else '0';

--cursor matching
  vga_RED <= '1' when (yframe = ypos) and (xframe = xpos) else '0';

  vga_BLUE <= xcheckerboard;  --arbitrary which is x which is y

  vga_GREEN <= ycheckerboard;
  reset     <= SW;

-- LED seg 7 display driver
  q0 <= std_logic_vector(ypos(3 downto 0));

  q2 <= std_logic_vector(xpos(3 downto 0));

  q3 <= "0000" when xpos <= x"0F" else "0001";

  AN        <= anode;
  SEG7_CATH <= seg7;

  clk <= CLK100MHZ;

  LED <= SW;
-- LED (8 downto 1) <= std_logic_vector(vga_REDGREENBLUE (11 downto 4)); used for debugging
end Behavioral;

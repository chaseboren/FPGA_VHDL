library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;


entity lab4_top is
  port (CLK100MHZ : in std_logic;

        SW : in std_logic;
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
  signal   btnDBU        : std_logic;
  signal   btnDBD        : std_logic;
  signal   btnDBL        : std_logic;
  signal   btnDBR        : std_logic;
  constant 25mhzmaxCount : unsigned (2 downto 0) := '100';
  signal   en25          : std_logic;

  signal horizontal_counter : unsigned (9 downto 0);
  signal vertical_counter   : unsigned (9 downto 0);

  --cursor positions
  signal xpos : unsigned (4 downto 0) := "0000";
  signal ypos : unsigned (4 downto 0) := "0000";
  --current checkerboard of the draw
  signal xframe : unsigned (4 downto 0);
  signal yframe : unsigned (4 downto 0);

  signal vga_ARGB : unsigned (3 downto 0); -- used to drive a mux for deciding on the color
  signal vga_REDGREENBLUE : std_logic_vector (11 downto 0)
  --the checkerboard variables flip every 32 bits. Uses mux to pick green or blue.
  signal xcheckerboard : unsigned := 0;
  signal ycheckerboard : unsigned := 0;

  signal clk   : std_logic;
  signal reset : std_logic;
  signal q0    : std_logic_vector (3 downto 0);
  signal q2    : std_logic_vector (3 downto 0);
  signal q3    : std_logic_vector (3 downto 0);
  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);--controls digit displayed.

  constant displayzero : std_logic_vector (3 downto 0) := "0000"; --used for five of the eight digits

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
  pulse_generator_small : entity pulse_generator_small
    port map (
      clk      => clk,
      reset    => reset,
      maxCount => 25hzmaxCount,
      pulseOut => en25
      );
  vertical_upCounter : entity vertical_upCounter
    port map (
      clk     => CLK100MHZ,
      reset   => reset,
      en      => en25,
      counter => vertical_counter
      );
  horizontal_upCounter : entity horizontal_upCounter
    port map (
      clk     => CLK100MHZ,
      reset   => reset,
      en      => en25,
      counter => horizontal_counter
      );
  seg7_controller : entity seg7_controller
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



  process(clk, horizontal_counter, vertica_counter)
  variable xpix_counter : unsigned (4 downto 0) := "00000";
  variable ypix_counter : unsigned (4 downto 0) := "00000";
  begin
    --synchronization
    if horizontal_counter >= "1010010000" then --656
      if horizontal_counter < "1011110000" then --752 as discussed in the lab hints
        VGA_HS <= "0";
      else
        VGA_HS <= "1";
      end if;
    else
      VGA_HS <= "1";
    end if;

    if vertical_counter >= "111101010" then --490
      if vertical_counter < "111101100" then --492 as discussed in the lab hints
        VGA_VS <= "0";
      else
        VGA_VS <= "1";
      end if;
    else
      VGA_VS <= "1";
    end if;

    -- Button counts
    if (reset ='1') then
      ypos <= (others => 0);
    elsif rising_edge(clk) then
      if rising_edge(btnDBU) = "1" then
        if ypos /= "00000"; then --helps to map to torus
          ypos <= ypos - 1;
        else
          ypos <= "01111";
        end if;
      elsif rising_edge(btnDBD) = "1" then
        if ypos < "01111"; then --helps to map to torus
          ypos = ypos + 1;
        else
          ypos = "00000";
        end if;
      end if;
    end if;


    if (reset ='1') then
      xpos <= (others => '0');
    elsif rising_edge(clk) then
      if rising_edge(btnDBL) then
        if xpos < "10011"; then --helps to map to torus
          xpos <= xpos + 1;
        else
          xpos <= "00000";
        end if;
      elsif rising_edge(btnDBR) then
        if xpos /= "00000"; then --helps to map to torus
          xpos = xpos - 1;
        else
          xpos = "10011";
        end if;
      end if;
    end if;


    if rising_edge(clk)
      if horizontal_counter <= "1010000000" then--640
        if vertical_counter <= "0111100000" then --480
         vga_ARGB (3) <= "1"; --screen not black
        else
         vga_ARGB (3) <= "0"; --screen black
        end if;
      end if;
    end if;


    if rising_edge(clk)
      if horizontal_counter <= "1010000000" then --640
        if xpix_counter = "11111" --five bit pattern to drive the checkerboard and indicate which square.
          xcheckerboard := not xcheckerboard;
          if xframe = x"13" then
            xframe = x"00";
          else
            xframe <= xframe + 1;
          end if;
        else
          xpix_counter := xpix_counter + 1;
        end if;
      end if;
    end if;

    if rising_edge(clk)
      if vertical_counter <= "0111100000" then --480
        if ypix_counter = "11111" --five bit counter to drive the checkerboard
          ycheckerboard := not ycheckerboard;
          if yframe = x"0E" then
            yframe = x"00";
          else
            yframe <= yframe + 1;
          end if;
        else
          ypix_counter := ypix_counter + 1;
        end if;
      end if;
    end if;


  end process;
 with vga_ARGB select --three bit mux to draw red green or blue tiles. A is for active.
 -- I could have been much simpler but was pretty far down this path when I realized
 -- I also had to draw black. R = 1 means the cursor is here. GB 11 or 00 is green, rest are blue
  vga_REDGREENBLUE <=
  x"F00" when "1100",
  x"F00" when "1101",
  x"F00" when "1111",
  x"F00" when "1101",
  x"0F0" when "1011",
  x"0F0" when "1000",
  x"00F" when "1010",
  x"00F" when "1001",
  x"000" when others;--paint it black

  VGA_R <= vga_REDGREENBLUE (11 downto 8);
  VGA_G <= vga_REDGREENBLUE (7 downto 4);
  VGA_B <= vga_REDGREENBLUE (3 downto 0);

--cursor matching
 vga_ARGB (2) <= "1" when (yframe = ypos) and (xframe = xpos) else
                "0";
 reset <= SW;
--display driver
 q0 <= std_logic_vector(ypos(3 downto 0));

 q2 <= std_logic_vector(xpos(3 downto 0));

 q3 <= "0000" when xpos(4) = 0 else "0001";

 LED <= SW;

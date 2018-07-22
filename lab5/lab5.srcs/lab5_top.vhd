


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;


entity lab5_top is
  generic(h_pulse  : integer := 96;
          h_bp     : integer := 48;
          h_pixels : integer := 640;
          h_fp     : integer := 16;

          v_pulse  : integer := 2;
          v_bp     : integer := 29;
          v_pixels : integer := 480;
          v_fp     : integer := 10);
  port (CLK100MHZ : in std_logic;

        SW  : in  std_logic_vector (4 downto 0);
        LED : out std_logic_vector (4 downto 0);

        BTNU : in std_logic;
        BTND : in std_logic;
        BTNL : in std_logic;
        BTNR : in std_logic;

        VGA_R    : out std_logic_vector (3 downto 0);
        VGA_G    : out std_logic_vector (3 downto 0);
        VGA_B    : out std_logic_vector (3 downto 0);
        --acceleromerter ports
        ACL_CSN  : out std_logic;
        ACL_SCLK : out std_logic;
        ACL_MOSI : out std_logic;
        ACL_MISO : in  std_logic;

        VGA_HS    : out std_logic;
        VGA_VS    : out std_logic;
        SEG7_CATH : out std_logic_vector (7 downto 0);
        AN        : out std_logic_vector (7 downto 0));
end lab5_top;

architecture lab5_top of lab5_top is

  signal btnDBU    : std_logic;
  signal btnDBD    : std_logic;
  signal btnDBL    : std_logic;
  signal btnDBR    : std_logic;
  signal btnDBRint : std_logic;
  signal btnDBLint : std_logic;
  signal btnDBUint : std_logic;
  signal btnDBDint : std_logic;

  constant twentyfivemhzmaxCount : unsigned (1 downto 0) := "11";
  signal   en25                  : std_logic;

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
  signal q0    : std_logic_vector (3 downto 0);  --for seg 7 controller for LEDs. the other register are fed zeroes.
  signal q2    : std_logic_vector (3 downto 0);
  signal q3    : std_logic_vector (3 downto 0);
  signal q4    : std_logic_vector (3 downto 0);
  signal q5    : std_logic_vector (3 downto 0);
  signal q6    : std_logic_vector (3 downto 0);
  signal q7    : std_logic_vector (3 downto 0);
  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);  --controls digit displayed.

  constant displayzero : std_logic_vector (3 downto 0) := "0000";  --used for five of the eight digits

  constant h_period  : integer := h_pulse + h_bp + h_pixels + h_fp;
  constant v_period  : integer := v_pulse + v_bp + v_pixels + v_fp;
  signal   vga_A     : std_logic;
  signal   vga_RED   : std_logic;
  signal   vga_GREEN : std_logic;
  signal   vga_BLUE  : std_logic;

  signal upperdigitsel : std_logic_vector(1 downto 0);

  signal DATA_X : std_logic_vector(7 downto 0);
  signal DATA_Y : std_logic_vector(7 downto 0);
  signal DATA_Z : std_logic_vector(7 downto 0);
  signal ID_AD  : std_logic_vector(7 downto 0);
  signal ID_1D  : std_logic_vector(7 downto 0);
  signal CSb    : std_logic;
  signal MOSI   : std_logic;
  signal SCLK   : std_logic;
  signal MISO   : std_logic;

  signal x_unfiltered : integer range -128 to 127;
  signal y_unfiltered : integer range -128 to 127;

  signal X_filteredneg : std_logic;
  signal XDBneg        : std_logic;
  signal X_filteredpos : std_logic;
  signal XDBpos        : std_logic;


  signal Y_filteredneg : std_logic;
  signal YDBneg        : std_logic;
  signal Y_filteredpos : std_logic;
  signal YDBpos        : std_logic;

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

  Debounce_X_pos : btnDebounce
    port map (
      clk   => clk,
      btn   => X_filteredpos,
      btnDB => XDBpos
      );

  Debounce_Y : btnDebounce
    port map (
      clk   => clk,
      btn   => Y_filteredpos,
      btnDB => YDBpos
      );
  Debounce_X_neg : btnDebounce
    port map (
      clk   => clk,
      btn   => X_filteredneg,
      btnDB => XDBneg
      );

  Debounce_Y_neg : btnDebounce
    port map (
      clk   => clk,
      btn   => Y_filteredneg,
      btnDB => YDBneg
      );

  pulse_generator_small_0 : entity pulse_generator_small
    port map (
      clk      => CLK100MHZ,
      reset    => reset,
      maxCount => twentyfivemhzmaxCount,
      pulseOut => en25
      );

  accel_spi_rw_0 : entity accel_spi_rw
    port map (
      clk    => clk,
      reset  => reset,
      DATA_X => DATA_X,
      DATA_Y => DATA_Y,
      DATA_Z => DATA_Z,
      ID_AD  => ID_AD,
      ID_1D  => ID_1D,
      CSb    => CSb,
      MOSI   => MOSI,
      SCLK   => SCLK,
      MISO   => MISO
      );

  seg7_controller_0 : entity seg7_controller
    port map (
      clk   => CLK100MHZ,
      reset => reset,
      q0    => q0,
      q1    => displayzero,
      q2    => q2,
      q3    => q3,
      q4    => q4,
      q5    => q5,
      q6    => q6,
      q7    => q7,
      anode => anode,
      seg7  => seg7
      );
  VGA_proc : process(clk, reset)
    variable xpix_counter : unsigned (4 downto 0)          := "00000";
    variable ypix_counter : unsigned (4 downto 0)          := "00000";
    variable h_count      : integer range 0 to h_period -1 := 0;
    variable v_count      : integer range 0 to v_period -1 := 0;
  begin
    if rising_edge(clk) then
      if en25 = '1' then
        if h_count < h_period - 1 then
          h_count    := h_count + 1;
          if h_count <= h_pixels then  --deviation from the vga_controller by Scott Larson. Corrected some "side-scrolling" issue by setting <= vice <
            xpix_counter := xpix_counter + 1;  --cheating some what  and letting it wraparound since unsigned.
            if xpix_counter = "00000" then  --increment sqyare
              xframe        <= xframe + 1;  --used in deciding which "square" the draw is in
              xcheckerboard <= not xcheckerboard;  -- used to drive blue-green logic.
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
              if ypix_counter = "00000" then  --resets every new square.
                yframe        <= yframe + 1;  --used in deciding which square the draw is in
                ycheckerboard <= not ycheckerboard;  --used to drive the blue green logic.
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
        if pos_source = '0' then
          if btnDBU = '1' then
            if ypos /= x"00" then       --helps to map to torus
              ypos <= ypos - 1;
            else
              ypos <= x"0E";
            end if;
          end if;
          if btnDBD = '1' then
            if ypos < x"0E" then        --helps to map to torus
              ypos <= ypos + 1;
            else
              ypos <= x"00";
            end if;
          end if;
        else
          if XDBpos = '1' then          -- up, weird due to mapping of chip
            if ypos /= x"00" then       --helps to map to torus
              ypos <= ypos - 1;
            else
              ypos <= x"0E";
            end if;
          end if;
          if XDBneg = '1' then
            if ypos < x"0E" then        --helps to map to torus
              ypos <= ypos + 1;
            else
              ypos <= x"00";
            end if;
          end if;
        end if;
        if pos_source = '0' then
          if btnDBR = '1' then
            if xpos < x"13" then        --helps to map to torus
              xpos <= xpos + 1;
            else
              xpos <= x"00";
            end if;
          end if;
          if btnDBL = '1' then
            if xpos /= x"00" then       --helps to map to torus
              xpos <= xpos - 1;
            else
              xpos <= x"13";
            end if;
          end if;
        else
          if YDBpos = '1' then
            if xpos < x"13" then        --helps to map to torus
              xpos <= xpos + 1;
            else
              xpos <= x"00";
            end if;
          end if;
          if YDBneg = '1' then
            if xpos /= x"00" then       --helps to map to torus
              xpos <= xpos - 1;
            else
              xpos <= x"13";
            end if;
          end if;
        end if;
      end if;
      if reset = '1' then  --resets cursor position. Has to be outside enable block because en25 is disabled during reest.
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
    x"000" when others;                 --paint it black

  VGA_R         <= vga_REDGREENBLUE (11 downto 8);
  VGA_G         <= vga_REDGREENBLUE (7 downto 4);
  VGA_B         <= vga_REDGREENBLUE (3 downto 0);
  vga_RED       <= '1' when (yframe = ypos) and (xframe = xpos) else '0';
  vga_BLUE      <= xcheckerboard;       --arbitrary which is x which is y
  vga_GREEN     <= ycheckerboard;
  reset         <= SW(0);
  upperdigitsel <= SW(4 downto 3);

  -- LED seg 7 display driver
  q7 <= ID_1D(7 downto 4) when upperdigitsel = '00' else
        displayzero;

  q6 <= ID_1D(3 downto 0) when upperdigitsel = '00'else
        displayzero;

  q5 <= ID_AD(7 downto 4) when upperdigitsel = '00'else
        DATA_X(7 downto 4) when upperdigitsel = '01' else
        DATA_Y(7 downto 4) when upperdigitsel = '10' else
        DATA_Z(7 downto 4) when upperdigitsel = '11';

  q4 <= ID_AD(3 downto 0) when upperdigitsel = '00'else
        DATA_X(3 downto 0) when upperdigitsel = '01' else
        DATA_Y(3 downto 0) when upperdigitsel = '10' else
        DATA_Z(3 downto 0) when upperdigitsel = '11';
  q0 <= std_logic_vector(ypos(3 downto 0));
  q2 <= std_logic_vector(xpos(3 downto 0));
  q3 <= "0000" when xpos <= x"0F" else "0001";

  AN         <= anode;
  SEG7_CATH  <= seg7;
  pos_source <= SW(1);
  clk        <= CLK100MHZ;

  LED      <= SW;
  MISO     <= ACL_MISO;
  ACL_MOSI <= MOSI;
  ACL_CSN  <= CSb;
  ACL_SCLK <= SCLK;

  x_unfiltered <= to_integer(signed(DATA_X));  --makes the manipulation easier. output is 2s complement.
  y_unfiltered <= to_integer(signed(DATA_Y));

  X_filteredpos <= '1' when x_unfiltered > 32  else '0';  --this is about 1/2 g
  X_filteredneg <= '1' when x_unfiltered < -32 else '0';

  Y_filteredpos <= '1' when y_unfiltered > 32  else '0';
  Y_filteredneg <= '1' when y_unfiltered < -32 else '0';

end architecture;

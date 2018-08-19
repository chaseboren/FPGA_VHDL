library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity lab7_top is
  port (CLK100MHZ : in std_logic;

        SW  : in  std_logic_vector (15 downto 0);
        LED : out std_logic_vector (15 downto 0);

        AUD_PWM : out std_logic;
        AUD_SD  : out std_logic;


        BTNC : in std_logic;

        SEG7_CATH : out std_logic_vector (7 downto 0);
        AN        : out std_logic_vector (7 downto 0)
        );
end lab7_top;

architecture behavorial of lab7_top is

  -- signal
  signal clk   : std_logic;
  signal reset : std_logic;

  signal q2 : std_logic_vector (3 downto 0);
  signal q3 : std_logic_vector (3 downto 0);
  signal q4 : std_logic_vector (3 downto 0);

  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);  --controls digit displayed.

  signal level_shifted_out     : std_logic_vector (9 downto 0);
  signal pre_level_shifted_out : unsigned (9 downto 0);
  signal level_shifted_int     : unsigned (9 downto 0);
  signal s_axis_phase_tvalid   : std_logic;
  signal s_axis_phase_tdata    : std_logic_vector(7 downto 0);
  signal m_axis_data_tvalid    : std_logic;
  signal m_axis_data_tdata     : std_logic_vector(15 downto 0);

  signal theta     : unsigned (7 downto 0);
  signal theta_slv : std_logic_vector (7 downto 0);

  signal cntr : unsigned (10 downto 0);

  signal freq_select : std_logic_vector (2 downto 0);
  signal freq_select2 : std_logic_vector (2 downto 0);
  signal freq_select3 : std_logic_vector (2 downto 0);
  signal sample_rate : integer range 0 to 782;
  signal pwm_out     : std_logic;

  signal vol_select : std_logic_vector (2 downto 0);

  constant displayzero : std_logic_vector (3 downto 0) := "0000";

begin
  LED       <= SW;
  AUD_SD    <= SW(15);
  AN        <= anode;
  SEG7_CATH <= seg7;
  clk       <= CLK100MHZ;
  reset <= BTNC;
  s_axis_phase_tvalid <= '1';
  s_axis_phase_tdata  <= theta_slv;

  level_shifted_int <= unsigned(not m_axis_data_tdata(15) & m_axis_data_tdata(14 downto 6));
  level_shifted_out <= std_logic_vector(pre_level_shifted_out);

  freq_select <= SW(2 downto 0);
  vol_select  <= SW(5 downto 3);
  theta_slv   <= std_logic_vector(theta);


  AUD_PWM <= '1' when freq_select = "000" else pwm_out;

  process (clk, reset)
  begin
    if (reset = '1' or (freq_select2 /= freq_select3)) then               --asynchronous reset and resets counter on switch change
      cntr  <= (others => '0');
      theta <= (others => '0');
    elsif (rising_edge(clk)) then
      if (cntr < sample_rate) then
        cntr <= cntr + 1;
        theta <= theta;              --iterate
      elsif (cntr = sample_rate) then
        cntr  <= (others => '0');
        theta <= theta + 1;
      end if;
    end if;
  end process;

  process(clk, reset) -- 4 bit flip flop
  begin
    if reset = '1' then                     --asynchronous reset
      freq_select2 <= (others => '0');
      freq_select3 <= (others => '0');
    elsif rising_edge(clk) then
        freq_select2 <= freq_select;
        freq_select3 <= freq_select2;
    end if;
  end process;

  with freq_select select               --input to sample rate generator
    sample_rate <=
    1 when "000",          -- DC will be handled with PWM-GEN elsewhere
    781 when "001",                     -- 500 Hz
    391 when "010",                     -- 1000 Hz, per lab guide
    260 when "011",                     -- 1500 Hz
    195 when "100",                     -- 2000 Hz
    156 when "101",                     -- 2500 Hz
    130 when "110",                     -- 3000 Hz
    112 when others;                    -- 3500 Hz

  with freq_select select               -- second digit in display
    q2 <=
    "0000" when "000",     -- DC will be handled with PWM-GEN elsewhere
    "0101" when "001",                  -- 500 Hz
    "0000" when "010",                  -- 1000 Hz, per lab guide
    "0101" when "011",                  -- 1500 Hz
    "0000" when "100",                  -- 2000 Hz
    "0101" when "101",                  -- 2500 Hz
    "0000" when "110",                  -- 3000 Hz
    "0101" when others;                 -- 3500 Hz

  with freq_select select               --leading digit for freq display
    q3 <=
    "0000" when "000",     -- DC will be handled with PWM-GEN elsewhere
    "0000" when "001",                  -- 500 Hz
    "0001" when "010",                  -- 1000 Hz, per lab guide
    "0001" when "011",                  -- 1500 Hz
    "0010" when "100",                  -- 2000 Hz
    "0010" when "101",                  -- 2500 Hz
    "0011" when "110",                  -- 3000 Hz
    "0011" when others;                 -- 3500 Hz
  with vol_select select                -- volume level to display
    q4 <=
    "0000" when "000",                  -- 1/128th volume
    "0001" when "001",                  -- 1/64th volume
    "0010" when "010",                  -- 1/32th volume
    "0011" when "011",                  -- 1/16th volume
    "0100" when "100",                  -- 1/8th volume
    "0101" when "101",                  -- 1/4th volume
    "0110" when "110",                  -- 1/2 volume
    "0111" when others;                 -- full volume


  with vol_select select  --this shifts the sine signal right corresponding to the selected volume level
    pre_level_shifted_out <=
    shift_right(level_shifted_int, 7) when "000",   -- 1/128th volume
    shift_right(level_shifted_int, 6) when "001",   -- 1/64th volume
    shift_right(level_shifted_int, 5) when "010",   -- 1/32th volume
    shift_right(level_shifted_int, 4) when "011",   -- 1/16th volume
    shift_right(level_shifted_int, 3) when "100",   -- 1/8th volume
    shift_right(level_shifted_int, 2) when "101",   -- 1/4th volume
    shift_right(level_shifted_int, 1) when "110",   -- 1/2 volume
    level_shifted_int                 when others;  -- full volume

  seg7_controller_0 : entity seg7_controller
    port map (
      clk   => clk,
      reset => reset,
      q0    => displayzero,             --lower 2 will always be zero
      q1    => displayzero,
      q2    => q2,
      q3    => q3,
      q4    => q4,
      q5    => displayzero,
      q6    => displayzero,
      q7    => displayzero,
      anode => anode,
      seg7  => seg7
      );

  sin_lut : entity dds_compiler_0
    port map (
      aclk                => clk,
      s_axis_phase_tvalid => s_axis_phase_tvalid,
      s_axis_phase_tdata  => s_axis_phase_tdata,
      m_axis_data_tvalid  => m_axis_data_tvalid,
      m_axis_data_tdata   => m_axis_data_tdata
      );

  pwm_generator_0 : entity pwm_generator
    port map (
      clk        => clk,
      reset      => reset,
      duty_cycle => level_shifted_out,
      pwm_out    => pwm_out
      );
end behavorial;

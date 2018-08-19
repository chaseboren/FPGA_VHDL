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

  signal q2    : std_logic_vector (3 downto 0);
  signal q3    : std_logic_vector (3 downto 0);
  signal q4    : std_logic_vector (3 downto 0);

  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);  --controls digit displayed.
  
  signal level_shifted_out : std_logic_vector (9 downto 0);
  signal level_shifted_in : std_logic_vector (9 downto 0);
  signal s_axis_phase_tvalid : STD_LOGIC;
  signal s_axis_phase_tdata : STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal m_axis_data_tvalid : STD_LOGIC;
  signal m_axis_data_tdata :  STD_LOGIC_VECTOR(15 DOWNTO 0);

  signal theta : unsigned (7 downto 0);
  signal theta_slv : std_logic_vector (7 downto 0);

  signal cntr : unsigned (10 downto 0); 

  signal freq_select : std_logic_vector (2 downto 0);
  signal sample_rate : integer range 0 to 782;
  signal pwm_out : std_logic;

  signal vol_select : std_logic_vector (2 downto 0);

  constant displayzero : std_logic_vector (3 downto 0) := "0000";
  
begin
  LED       <= SW;
  AUD_SD    <= SW(15);
  AN        <= anode;
  SEG7_CATH <= seg7;
  clk <= CLK100MHZ; 

  s_axis_phase_tvalid <= '1';
  s_axis_phase_tdata <= theta_slv;
  
  level_shifted_in < not m_axis_data_tdata(15) & m_axis_data_tdata(14 downto 5);

  freq_select <= SW(2 downto 0);
  vol_select <= SW(5 downto 3);
  theta_slv <= std_logic_vector(theta);
  

  AUD_PWM <= '1' when freq_select = "000" else pwm_out;

  process (clk, reset)
  begin
    if (reset = '1') then--asynchronous reset
      cntr <= (others => '0');
      theta <= (others => '0');
    elsif (rising_edge(clk)) then
      if (cntr < sample_rate) then
        cntr <= cntr + 1;--iterate
        elsif (cntr = sample_rate)
        cntr <= (others => '0');
        theta <= theta + 1; 
      end if;
    end if;
  end process;

  with freq_select select --input to sample rate generator 
    sample_rate <=
          1 when "000", -- DC will be handled with PWM-GEN elsewhere
        781 when "001", -- 500 Hz
        391 when "010", -- 1000 Hz, per lab guide
        260 when "011", -- 1500 Hz
        195 when "100", -- 2000 Hz
        156 when "101", -- 2500 Hz
        130 when "110", -- 3000 Hz
        112 when others; -- 3500 Hz

  with freq_select select -- second digit in display
    q2 <= -
    "0000" when "000", -- DC will be handled with PWM-GEN elsewhere
    "0101" when "001", -- 500 Hz
    "0000" when "010", -- 1000 Hz, per lab guide
    "0101" when "011", -- 1500 Hz
    "0000" when "100", -- 2000 Hz
    "0101" when "101", -- 2500 Hz
    "0000" when "110", -- 3000 Hz
    "0101" when others; -- 3500 Hz  

  with freq_select select --leading digit for freq display
    q3 <=
    "0000" when "000", -- DC will be handled with PWM-GEN elsewhere
    "0000" when "001", -- 500 Hz
    "0001" when "010", -- 1000 Hz, per lab guide
    "0001" when "011", -- 1500 Hz
    "0010" when "100", -- 2000 Hz
    "0010" when "101", -- 2500 Hz
    "0011" when "110", -- 3000 Hz
    "0011" when others; -- 3500 Hz
  with vol_select select -- volume level to display
    q4 <=
    "0000" when "000", -- 1/128th volume
    "0001" when "001", -- 1/64th volume
    "0010" when "010", -- 1/32th volume
    "0011" when "011", -- 1/16th volume
    "0100" when "100", -- 1/8th volume
    "0101" when "101", -- 1/4th volume
    "0110" when "110", -- 1/2 volume
    "0111" when others; -- full volume


  with vol_select select --this shifts the sine signal right corresponding to the selected volume level
    level_shifted_out <=
    level_shifted_in srl 7 when "000",   -- 1/128th volume
    level_shifted_in srl 6 when "001",    -- 1/64th volume
    level_shifted_in srl 5 when "010",   -- 1/32th volume
    level_shifted_in srl 4 when "011",   -- 1/16th volume
    level_shifted_in srl 3 when "100",    -- 1/8th volume
    level_shifted_in srl 2 when "101",    -- 1/4th volume
    level_shifted_in srl 1 when "110",    -- 1/2 volume
    level_shifted_in  when others;    -- full volume

 seg7_controller_0 : entity seg7_controller
    port map (
      clk   => clk,
      reset => reset,
      q0    => displayzero, --lower 2 will always be zero
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
    PORT MAP (
        aclk => clk,
        s_axis_phase_tvalid => s_axis_phase_tvalid,
        s_axis_phase_tdata => s_axis_phase_tdata,
        m_axis_data_tvalid => m_axis_data_tvalid,
        m_axis_data_tdata => m_axis_data_tdata
      );

 pwm_generator_0 : entity pwm_generator
    port map (
       clk => clk,
      reset => reset,
      duty_cycle => level_shifted_out,
      pwm_out => pwm_out
     );
end behavorial;

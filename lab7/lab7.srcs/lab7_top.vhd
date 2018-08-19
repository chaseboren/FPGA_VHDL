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
        AN        : out std_logic_vector (7 downto 0));

  );
end lab7_top;

architecture behavorial of lab7_top is

  -- signal
  signal clk : std_logic;
  signal reset : std_logic;
  signal q0    : std_logic_vector (3 downto 0);  --for seg 7 controller for LEDs. the other register are fed zeroes.
  signal q1    : std_logic_vector (3 downto 0);
  signal q2    : std_logic_vector (3 downto 0);
  signal q3    : std_logic_vector (3 downto 0);
  signal q4    : std_logic_vector (3 downto 0);
  signal q5    : std_logic_vector (3 downto 0);
  signal q6    : std_logic_vector (3 downto 0);
  signal q7    : std_logic_vector (3 downto 0);
  signal anode : std_logic_vector (7 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);  --controls digit displayed.

begin
  LED <= SW;
  AUD_SD <= SW(15);
  AN        <= anode;
  SEG7_CATH <= seg7;

  seg7_controller_0 : entity seg7_controller
    port map (
      clk   => CLK100MHZ,
      reset => reset,
      q0    => q0,
      q1    => q1,
      q2    => q2,
      q3    => q3,
      q4    => q4,
      q5    => q5,
      q6    => q6,
      q7    => q7,
      anode => anode,
      seg7  => seg7
      );

end behavorial;

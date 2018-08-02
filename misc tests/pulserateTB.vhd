library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity pulseRateTB is
end pulseRateTB;

architecture testbench of pulseRateTB is

  signal clk : std_logic;
  signal reset : std_logic;
  signal pulseIn : std_logic;
  signal pulseRate : unsigned (15 downto 0);

begin
  clock : process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  reset   <= '1', '0' after 60 ns;
  pulseIn <= '0', '1' after 100 ns, '0' after 110 ns, '1' after 300 ns, '0' after 310 ns, '1' after 11 ms, '0' after 11000010 ns;

  pulseRateMeasure_i : entity pulseRateMeasure
    port map (
      clk100    => clk,
      reset     => reset,
      pulseIn   => pulseIn,
      pulseRate => pulseRate
      );


end testbench;

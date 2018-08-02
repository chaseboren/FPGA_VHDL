library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity LEDtoggleTB is
end LEDtoggleTB;

architecture testbench of LEDtoggleTB is

  signal LEDout : std_logic;
  signal clk : std_logic;
  signal cntr : unsigned (15 downto 0);
  signal q : std_logic;
  signal reset : std_logic;
  signal synchpulse : std_logic;
  signal detect : std_logic;

begin
  clock : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  reset   <= '1', '0' after 20 ns;
  synchpulse <= '0', '1' after 30 ns, '0' after 90 ns, '1' after 130 ns, '0' after 150 ns, '1' after 170 ns, '0' after 210 ns;

  process(clk, reset)
  begin
    if reset = '1' then
        LEDout <= '0';
        cntr <= (others => '0');
        q <= '0';
    elsif rising_edge(clk) then
        q <= synchpulse;
      --  q(1) <= q(0); -- creating a shift register to hold the state
        if detect ='1' then
          LEDout <= not LEDout;
          cntr <= cntr + 1;
        end if;
    end if;
  end process;
  detect <= '1' when (synchpulse = '1') and (q = '0') else '0';


end testbench;

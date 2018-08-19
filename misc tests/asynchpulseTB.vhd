library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity asynchpulseTB is
end asynchpulseTB;

architecture testbench of asynchpulseTB is

  signal clk                      : std_logic;
  signal asynch                   : std_logic;
  signal stretchedpulse           : std_logic;
  signal reset                    : std_logic;
  signal cntr                     : integer range 0 to 50000;
  signal A, B                     : signed (2 downto 0);
  signal C, D, E1, E2, E3, E4, E5 : signed (5 downto 0);
begin
  clock : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  reset  <= '1', '0' after 20 ns;
  asynch <= '0', '1' after 28 ns, '0'after 68 ns, '1' after 101 ns, '0' after 150 ns;

  process(clk, reset)
  begin
    if reset = '1' then
      cntr           <= 0;
      stretchedpulse <= '0';
    elsif rising_edge(clk) then
      if asynch = '1' then
        if cntr < 50000 then
          cntr           <= cntr + 1;
          stretchedpulse <= '1';
        else
          cntr           <= 0;
          stretchedpulse <= '0';
        end if;
      elsif cntr > 0 then
        if cntr < 50000 then
          stretchedpulse <= '1';
          cntr           <= cntr + 1;
        else
          stretchedpulse <= '0';
          cntr           <= 0;
        end if;
      end if;
    end if;

  end process;
  A <= "110";
  B <= "100";
  C <= "011000";
  D <= "111011";

  E1 <= A & not B xor C ror 2;
  E2 <= D ror 2 or not A & B;
  E3 <= resize(A*B, 3) & not A;
  E4 <= -A*B + C;
  E5 <= A*B - C srl 3;

end testbench;

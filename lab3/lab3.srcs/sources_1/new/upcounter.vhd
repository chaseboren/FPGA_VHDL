library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity upCounter is
  port(clk     : in  std_logic;
       reset   : in  std_logic;
       en : in std_logic;
       counter : out unsigned(2 downto 0));
end upCounter;

architecture rtl of upCounter is
  signal cntr_sig : unsigned(2 downto 0);

begin
  process (clk, reset)
  begin
    if (reset = '1') then
      cntr_sig <= (others => '0');
    elsif (rising_edge(clk)) then
      if (en='1')then
        cntr_sig <= cntr_sig + 1;
      end if;
    end if;
  end process;
  counter <= cntr_sig;
end rtl;

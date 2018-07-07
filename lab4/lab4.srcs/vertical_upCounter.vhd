library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--Implemented as described in the lecture. This is pretty simple could
--be improved to have an integer as in input to count up to but may not
--be the minimum arrangement
entity vertical_upCounter is
  port(clk     : in  std_logic;
       reset   : in  std_logic;
       en      : in  std_logic;
       counter : out unsigned(9 downto 0));  --counts 0-7 (or 1-8)
end vertical_upCounter;

architecture rtl of upCounter is
  signal cntr_sig : unsigned(9 downto 0);

begin
  process (clk, reset)
    constant maxCount : unsigned(9 downto 0) := 1000001000;  --this is 520
  begin
    if (reset = '1') then               --asynchronous reset
      cntr_sig <= (others => '0');
    elsif (rising_edge(clk)) then
      if (en = '1')then
        if cntr_sig < maxCount then
          cntr_sig <= cntr_sig + 1;     --iterate
        else
          cntr_sig <= (others => '0');
        end if;
      end if;
    end if;
  end process;
  counter <= cntr_sig;
end rtl;

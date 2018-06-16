library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Dtype is
  port(clk   : in  std_logic;
       reset : in  std_logic;
       d     : in  std_logic_vector(3 downto 0)
       en    : in  std_logic;
       q     : out std_logic_vector(3 downto 0));
end Dtype;

architecture rtl of Dtype is
begin
  process (clk, reset)
  begin
    if (reset = '1') then
      q <= (others => '0');
    elsif (rising_edge(clk)) then
      if (en = '1') then
        q <= d;
      end if;
    end if;
  end process;
end rtl

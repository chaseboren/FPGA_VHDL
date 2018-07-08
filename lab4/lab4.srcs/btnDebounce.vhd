library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;


entity btnDebounce is
  port (clk   : in  std_logic;
        btn   : in  std_logic;
        btnDB : out std_logic);
end btnDebounce;

architecture rtl of btnDebounce is

begin
  process(clk)
    variable counter    : unsigned(23 downto 0) := (others => '0');
    constant maxCounter : unsigned(23 downto 0) := "100110001001011010000000";
  begin
    if rising_edge(clk) then
      if btn = '1' then
        if counter < maxCounter then
          counter := counter + 1;
        else
          btnDB <= '1';
        end if;
      else
        btnDB   <= '0';
        counter := (others => '0');
      end if;
    end if;
  end process;
end rtl;

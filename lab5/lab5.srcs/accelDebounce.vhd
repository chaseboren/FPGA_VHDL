library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;
--1 ms btn debounce. desinged to work with the vga display driver which is
--driven by a master clock derived 25 MHz clock.

entity accelDebounce is
  port (clk      : in  std_logic;
        btn      : in  std_logic;
        btnDB    : out std_logic;
        axisflat : in  std_logic);
end accelDebounce;

architecture rtl of accelDebounce is

begin
  process(clk)
    variable counter    : unsigned(23 downto 0) := (others => '0');
    variable counter2   : unsigned(23 downto 0) := (others => '0');
    variable toggle     : std_logic             := '0';
    constant maxCounter : unsigned(23 downto 0) := "000001011111111111111111";  -- not calculated
  begin
    if rising_edge(clk) then
      if btn = '1' then
        if counter < maxCounter then
          counter := counter + 1;
        elsif counter <= maxCounter + 3 then  --have to hit one and only one cycle where en25 in lab 4 top file is high. at +4, would get multiple movements
          if toggle = '0' then
            btnDB   <= '1';
            counter := counter + 1;
          end if;
        elsif counter = maxCounter + 4 then
          btnDB  <= '0';
          toggle := '1';
          counter := counter + 1;
        else
          btnDB <= '0';
        end if;
      else
        btnDB   <= '0';
        counter := (others => '0');
      end if;
      if toggle = '1' then
        if axisflat = '1' then
          if counter2 < maxCounter then
            counter2 := counter2 + 1;
          else
            counter2 := (others => '0');
            toggle := '0';
          end if;
        elsif axisflat = '0' then
          counter2 := (others => '0');
        end if;
      end if;
    end if;
  end process;
end rtl;

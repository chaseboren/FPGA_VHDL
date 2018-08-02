library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;


entity pulseRateMeasure is port (
   clk100    : in std_logic;               -- 100 MHz FPGA clock
   reset     : in std_logic;               -- asynchronous reset
   pulseIn   : in std_logic;               -- incoming pulse
   pulseRate : out unsigned(15 downto 0)   -- data in signal to be filtered
);
end pulseRateMeasure;

architecture pulseRateMeasure of pulseRateMeasure is

  signal ten_msPulse : std_logic;
  signal ten_msCntr : unsigned (19 downto 0);
  signal cntr2 : unsigned (15 downto 0);
  signal cntr3 : unsigned (15 downto 0);
  signal clear : std_logic;

begin
  process(clk100, reset)
  begin
    if reset = '1' then
        ten_msCntr <= (others => '0');
    elsif rising_edge(clk100) then
      if clear = '1' then
        ten_msCntr <= (others => '0');
      else
        ten_msCntr <= ten_msCntr + 1;
      end if;
    end if;
  end process;
  clear <= '1' when (ten_msCntr = "11110100001001000000") else '0'; --1 million to get 10 ms
  ten_msPulse <= clear;

  process(clk100, reset)
  begin
    if reset = '1' then
      cntr2 <= (others => '0');
      cntr3 <= (others => '0');
    elsif rising_edge(clk100) then
      if pulseIn = '1' then
        cntr2 <= cntr2 + 1;
      elsif ten_msPulse = '1' then
        cntr3 <= cntr2;
        cntr2 <= (others => '0');
      end if;
    end if;
  end process;
  pulseRate <= cntr3;

end architecture;

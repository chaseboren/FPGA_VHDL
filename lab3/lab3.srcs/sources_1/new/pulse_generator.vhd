library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity pulse_generator is
  port (clk      : in  std_logic;
        reset    : in  std_logic;
        maxCount : in  unsigned (26 downto 0);--27 bits to get to 100 million which ultimately allows for 1 Hz.
        pulseOut : out std_logic);
end pulse_generator;

architecture Behavioral of pulse_generator is
  signal pulseCnt : unsigned(26 downto 0);
  signal clear    : std_logic;
begin
  -- pulse_generator
  process(clk, reset)--only changes with clock and the asynchronous reset
  begin
    if(reset = '1')then
      pulseCnt <= (others => '0');--Reset
    elsif (rising_edge(clk)) then
      if (clear = '1') then
        pulseCnt <= (others => '0');--roll counter over.
      else
        pulseCnt <= pulseCnt+1;--increment each clock cycle
      end if;
    end if;
  end process;
  clear    <= '1' when (pulseCnt = maxCount)else '0';
  pulseOut <= clear;
end Behavioral;

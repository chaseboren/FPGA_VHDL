library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity pulse_generator_small is
  port (clk      : in  std_logic;
        reset    : in  std_logic;
        maxCount : in  unsigned (1 downto 0);  -- only need 2 bits. 
        pulseOut : out std_logic);
end pulse_generator_small;

architecture Behavioral of pulse_generator_small is
  signal pulseCnt : unsigned(1 downto 0);
  signal clear    : std_logic;
begin
  -- pulse_generator
  process(clk, reset)  --only changes with clock and the asynchronous reset
  begin
    if(reset = '1')then
      pulseCnt <= (others => '0');      --Reset
    elsif (rising_edge(clk)) then
      if (clear = '1') then
        pulseCnt <= (others => '0');    --roll counter over.
      else
        pulseCnt <= pulseCnt+1;         --increment each clock cycle
      end if;
    end if;
  end process;
  clear    <= '1' when (pulseCnt = maxCount)else '0';
  pulseOut <= clear;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: JHU
-- Engineer: Boren
--
-- Create Date: 06/16/2018 11:18:25 AM
-- Design Name: Generic pulse_generator
-- Module Name: pulse_generator - Behavioral
-- Project Name: VHDL for FPGAs
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Vivado 2018.1
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Original revision is as given in Lab 3 hints.
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_generator is
  port (clk      : in  std_logic;
        reset    : in  std_logic;
        maxCount : in  unsigned (26 downto 0);
        pulseOut : out std_logic);
end pulse_generator;

architecture Behavioral of pulse_generator is
  signal pulseCnt : unsigned(26 downto 0);
  signal clear    : std_logic;
begin
  --Pulse pulse_generator
  process(clk, reset)
  begin
    if(reset = '1')then
      pulseCnt <= (others => '0');
    elsif (rising_edge(clk)) then
      if (clear = '1') then
        pulseCnt <= (others => '0');
      else
        pulseCnt <= pulseCnt+1;
      end if;
    end if;
  end process;
  clear    <= '1' when (pulseCnt = maxCount)else '0';
  pulseOut <= clear;
end Behavioral;

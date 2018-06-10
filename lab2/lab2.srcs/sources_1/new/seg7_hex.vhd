----------------------------------------------------------------------------------
-- Company: JHU
-- Engineer: Boren
--
-- Create Date: 06/09/2018
-- Design Name: N/A
-- Module Name: seg7_hex - Behavioral
-- Project Name: Lab 1
-- Target Devices: Nexys4 DDR
-- Tool Versions: Vivado 2018.1
-- Description: Converts 4 bit number into a 7 segment representation (8 bit output)
--
-- Dependencies: N/A
--
-- Revision: 2.0
-- Revision 0.01 - File Created
-- Additional Comments: Same as lab 1 but implements logic in a process
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity seg7_hex is
  port (digit : in  std_logic_vector (3 downto 0);
        seg7  : out std_logic_vector (7 downto 0));
end seg7_hex;

architecture Behavioral of seg7_hex is

  --signal display_digit : std_logic_vector(3 downto 0);

begin

  --display_digit <= digit (3 downto 0);
  process(digit)
  begin
    case digit is                       --Implements task 2 when sel not available in process. I went with case because it seemed cleaner than nested if then else.
      when x"0"   => seg7 <= "11000000";
      when x"1"   => seg7 <= "11111001";
      when x"2"   => seg7 <= "10100100";
      when x"3"   => seg7 <= "10110000";
      when x"4"   => seg7 <= "10011001";
      when x"5"   => seg7 <= "10010010";
      when x"6"   => seg7 <= "10000010";
      when x"7"   => seg7 <= "11111000";
      when x"8"   => seg7 <= "10000000";
      when x"9"   => seg7 <= "10010000";
      when x"A"   => seg7 <= "10001000";
      when x"B"   => seg7 <= "10000011";
      when x"C"   => seg7 <= "11000110";
      when x"D"   => seg7 <= "10100001";
      when x"E"   => seg7 <= "10000110";
      when others => seg7 <= "10001110";
    end case;


  end process;

end Behavioral;

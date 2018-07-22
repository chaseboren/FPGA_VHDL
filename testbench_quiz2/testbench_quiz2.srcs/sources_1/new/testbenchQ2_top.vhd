----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06/10/2018 12:53:21 PM
-- Design Name:
-- Module Name: testbenchQ2_top - testbenchQ2_top
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--use work.all
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbenchq2_top is
end;

architecture testbench of testbenchq2_top is
  signal b, c, d : std_logic;
begin
  b <= '0', '1' after 20 ns, '0' after 40 ns;
  example : process(b)
  begin
    c <= not b;
    d <= not c;
    c <= b;
    c <= not b;
  end process example;
end testbench;

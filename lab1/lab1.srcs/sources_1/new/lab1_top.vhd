----------------------------------------------------------------------------------
-- Company:  JHU
-- Engineer: Boren
--
-- Create Date: 06/02/2018 09:47:11 AM
-- Design Name:
-- Module Name: lab1_top - Behavioral
-- Project Name: Lab 1
-- Target Devices: Nexys4 DDR
-- Tool Versions: Vivado 2018.1
-- Description: Uses slider switches and push buttons on board to light the 7 segment displays. 
--
-- Dependencies: seg7_hex
--
-- Revision: 1.0
-- Revision 0.01 - File Created
-- Additional Comments: N/A
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab1_top is
    Port ( --Buttons
           BTNC : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           --Switch positions
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           --Leds (16)
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           --7 segment display signals
           SEG7_CATH : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end lab1_top;

architecture Behavioral of lab1_top is
  signal digit : STD_LOGIC_VECTOR (3 downto 0);
  signal seg7  : STD_LOGIC_VECTOR (7 downto 0);
--  signal btnc  : STD_LOGIC; not needed
--  signal btnd  : STD_LOGIC;
--  signal btnu  : STD_LOGIC;

begin
  --assignments
  digit <= SW (3 downto 0) when BTNC ='0' else -- implements task 3 requirement 1 & 5b
           x"0";
  SEG7_CATH <= seg7;
  LED <= SW (15 downto 0);--implements Task 3 requirement 6

  AN <= "00000000" when BTNC = '1' else --this is the highest priority. Implements Task 3 requirement 5a
        "00001111" when BTNU = '1' else -- set up to be like the video. Implements Task 3 requirement 3
        "11110000" when BTND = '1' else -- Implements Task 3 requirement 4.
        not SW(11 downto 4);--Power is supplied to the displays when the output is low. Implements task 3 requirement 2a
--instantiating the 7 segment encoder.
        seg7_hex_1 : entity seg7_hex
        port map (
          digit => digit,
          seg7  => seg7
        );--implements task 3 requirement 2b


end Behavioral;

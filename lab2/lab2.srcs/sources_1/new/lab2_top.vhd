----------------------------------------------------------------------------------
-- Company:  JHU
-- Engineer: Boren
--
-- Create Date: 06/09/2018
-- Design Name:
-- Module Name: lab2_top - Behavioral
-- Project Name: Lab 2
-- Target Devices: Nexys 4 DDR
-- Tool Versions:
-- Description:
--
-- Dependencies: seg7_hex.vhd
--
-- Revision:2.0
-- Revision 0.01 - File Created
-- Additional Comments: implements logic in a process
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;--required to include local directory modules, i.e. seg7


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab2_top is
  port (                                --Buttons
    BTNC      : in  std_logic;
    BTND      : in  std_logic;
    BTNU      : in  std_logic;
    --Switch positions
    SW        : in  std_logic_vector (15 downto 0);
    --Leds (16)
    LED       : out std_logic_vector (15 downto 0);
    --7 segment display signals
    SEG7_CATH : out std_logic_vector (7 downto 0);
    AN        : out std_logic_vector (7 downto 0));
end lab2_top;

architecture Behavioral of lab2_top is
  signal digit : std_logic_vector (3 downto 0);
  signal seg7  : std_logic_vector (7 downto 0);
--  signal btnc  : STD_LOGIC;
--  signal btnd  : STD_LOGIC;
--  signal btnu  : STD_LOGIC;

begin
  process(SW, BTNC, BTND, BTNU)         --assignments
    digit     <= SW (3 downto 0) when BTNC = '0' else  -- implements task 3 requirement 1 & 5b
    x"0";
    SEG7_CATH <= seg7;
    LED       <= SW (15 downto 0);      --implements Task 3 requirement 6

    AN <= "00000000" when BTNC = '1' else  --this is the highest priority. Implements Task 3 requirement 5a
          "00001111" when BTNU = '1' else  -- set up to be like the video. Implements Task 3 requirement 3
          "11110000" when BTND = '1' else  -- Implements Task 3 requirement 4.
          not SW(11 downto 4);  --Power is supplied to the displays when the output is low. Implements task 3 requirement 2a
  end process;
--instantiating the 7 segment encoder.
    seg7_hex_1 : entity seg7_hex
    port map (
      digit => digit,
      seg7  => seg7
      );                                --implements task 3 requirement 2b


end Behavioral;

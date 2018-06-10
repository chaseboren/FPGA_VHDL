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
use work.all;  --required to include local directory modules, i.e. seg7


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
  process(SW, BTNC, BTND, BTNU, seg7)
  begin  --assignments
    if BTNC = '1' then  -- implements task 3 requirement 1 & 5b, cannot use when else in process
      digit <= x"0";
      AN    <= "00000000";
    else
      digit <= SW(3 downto 0);
      if BTNU = '1' then  -- set up to be like the video. Implements Task 3 requirement 3, could have been done with at case based truth table or setting some default behavior in the case table when more the one button pressed.
        AN <= "00001111";
      else
        if BTND = '1' then              -- Implements Task 3 requirement 4.
          AN <= "11110000";
        else
          AN <= not SW(11 downto 4);  --Power is supplied to the displays when the output is low. Implements task 3 requirement 2a
        end if;
      end if;
    end if;
    SEG7_CATH <= seg7;
    LED       <= SW (15 downto 0);      --implements Task 3 requirement 6

  end process;
  seg7_hex_1 : entity seg7_hex
    port map (
      digit => digit,
      seg7  => seg7
      );  --instantiating the 7 segment encoder. implements task 3 requirement 2b

end Behavioral;

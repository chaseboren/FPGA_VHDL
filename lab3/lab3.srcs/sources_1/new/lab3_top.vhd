----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06/16/2018 11:12:44 AM
-- Design Name:
-- Module Name: lab3_top - Behavioral
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
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3_top is
  port (CLK100MHZ : in  std_logic;
        SW        : in  std_logic_vector (3 downto 0);
        BTNC      : in  std_logic;
        SEG7_CATH : out std_logic_vector (7 downto 0);
        AN        : out std_logic_vector (7 downto 0));
end lab3_top;

architecture Behavioral of lab3_top is
  signal clk      : std_logic;
  signal pulse1Hz : std_logic;
  signal max1Hz   : unsigned (26 downto 0);
  signal reset    : std_logic;
  signal d0       : std_logic_vector (3 downto 0);
  signal q0       : std_logic_vector (3 downto 0);
  signal q1       : std_logic_vector (3 downto 0);
  signal q2       : std_logic_vector (3 downto 0);
  signal q3       : std_logic_vector (3 downto 0);
  signal q4       : std_logic_vector (3 downto 0);
  signal q5       : std_logic_vector (3 downto 0);
  signal q6       : std_logic_vector (3 downto 0);
  signal q7       : std_logic_vector (3 downto 0);
  signal seg7     : std_logic_vector (7 downto 0);
  signal anode    : std_logic_vector (7 downto 0);
--signal digit    : std_logic_vector (3 downto 0);
begin
  reset     <= BTNC;
  d0        <= SW;
  SEG7_CATH <= seg7;
  clk       <= CLK100MHZ;
  max1Hz    <= "101111101011110000100000000";
  AN        <= anode;
  pulse_generator_0 : entity pulse_generator
    port map (
      clk      => clk,
      reset    => reset,
      maxCount => max1Hz,
      pulseOut => pulse1Hz
      );
  Dtype_0 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => d0,
      q     => q0,
      en    => pulse1Hz
      );
  Dtype_1 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q0,
      q     => q1,
      en    => pulse1Hz
      );
  Dtype_2 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q1,
      q     => q2,
      en    => pulse1Hz
      );
  Dtype_3 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q2,
      q     => q3,
      en    => pulse1Hz
      );
  Dtype_4 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q3,
      q     => q4,
      en    => pulse1Hz
      );
  Dtype_5 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q4,
      q     => q5,
      en    => pulse1Hz
      );
  Dtype_6 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q5,
      q     => q6,
      en    => pulse1Hz
      );
  Dtype_7 : entity Dtype
    port map (
      clk   => clk,
      reset => reset,
      d     => q6,
      q     => q7,
      en    => pulse1Hz
      );
  seg7_controller_1 : entity seg7_controller
    port map (
      clk   => clk,
      reset => reset,
      q0    => q0,
      q1    => q1,
      q2    => q2,
      q3    => q3,
      q4    => q4,
      q5    => q5,
      q6    => q6,
      q7    => q7,
      anode => anode,
      seg7  => seg7
      );
end Behavioral;

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
  signal clk           : std_logic;
  signal pulse1Hz      : std_logic;
  signal pulse1KHz     : std_logic;
  signal max1Hz        : unsigned (26 downto 0);
  signal max1kHz       : unsigned (26 downto 0);
  signal anode_counter : unsigned(2 downto 0);
  signal reset         : std_logic;
  signal d0            : std_logic_vector (3 downto 0);
  signal q0            : std_logic_vector (3 downto 0);
  signal q1            : std_logic_vector (3 downto 0);
  signal q2            : std_logic_vector (3 downto 0);
  signal q3            : std_logic_vector (3 downto 0);
  signal q4            : std_logic_vector (3 downto 0);
  signal q5            : std_logic_vector (3 downto 0);
  signal q6            : std_logic_vector (3 downto 0);
  signal q7            : std_logic_vector (3 downto 0);
  signal seg7          : std_logic_vector (7 downto 0);
  signal digit         : std_logic_vector (3 downto 0);
begin
  reset     <= BTNC;
  d0        <= SW;
  SEG7_CATH <= seg7;
  clk       <= CLK100MHZ;
  max1Hz    <= "101111101011110000100000000";
  max1KHz   <= "000000000011000011010100000";
  pulse_generator_1 : entity pulse_generator
    port map (
      clk       => clk,
      reset     => reset,
      maxCount => max1KHz,
      pulseOut  => pulse1Khz
      );
  pulse_generator_2 : entity pulse_generator
    port map (
      clk      => clk,
      reset    => reset,
      maxCount => max1Hz,
      pulseOut => pulse1Hz
      );
  upCounter_1 : entity upCounter
    port map (
      clk     => clk,
      reset   => reset,
      counter => anode_counter,
      en      => pulse1KHz
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
  seg7_hex_1 : entity seg7_hex
    port map (
      digit => digit,
      seg7  => seg7
      );

  process(reset, anode_counter)
  begin
    if (reset = '1') then
      AN <= x"fe";
    else
      case anode_counter is
        when "000" => AN <= x"fe";
        when "001" => AN <= x"fd";
        when "010" => AN <= x"fb";
        when "011" => AN <= x"f7";
        when "100" => AN <= x"ef";
        when "101" => AN <= x"df";
        when "110" => AN <= x"bf";
        when "111" => AN <= x"7f";
        when others => AN <=x"fe";
      end case;
    end if;
  end process;
  with anode_counter select
    digit <=
    q0   when x"0",
    q1   when x"1",
    q2   when x"2",
    q3   when x"3",
    q4   when x"4",
    q5   when x"5",
    q6   when x"6",
    q7   when x"7",
    x"0" when others;

end Behavioral;

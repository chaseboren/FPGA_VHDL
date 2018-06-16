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
        AN        : out std_logic_vector (7 downto 0))
    );
end lab3_top;

architecture Behavioral of lab3_top is
  signal pulse1Hz      : std_logic;
  signal pulse1KHz     : std_logic;
  signal anode_counter : std_logic_vector(2 downto 0);
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
  pulse_generator_1 : pulse_generator
    port map (
      CLK100MHZ                     => clk,
      reset                         => reset,
      "101111101011110000100000000" => maxCount,
      pulse1Hz                      => pulseOut
      );
  pulse_generator_2 : pulse_generator
    port map (
      CLK100MHZ                     => clk,
      reset                         => reset,
      "000000000011000011010100000" => maxCount,
      pulse1KHz                     => pulseOut
      );
  upCounter_1 : upCounter
    port map (
      CLK100MHZ     => clk,
      reset         => reset,
      anode_counter => counter,
      pulse1KHz     => en
      );
  Dtype_0 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      d0       => d,
      q0       => q,
      pulse1Hz => en
      );
  Dtype_1 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q0       => d,
      q1       => q,
      pulse1Hz => en
      );

  Dtype_2 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q1       => d,
      q2       => q,
      pulse1Hz => en
      );
  Dtype_3 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q2       => d,
      q3       => q,
      pulse1Hz => en
      );
  Dtype_4 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q3       => d,
      q4       => q,
      pulse1Hz => en
      );
  Dtype_5 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q4       => d,
      q5       => q,
      pulse1Hz => en
      );
  Dtype_6 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q5       => d,
      q6       => q,
      pulse1Hz => en
      );
  Dtype_7 : Dtype
    port map (
      clk      => clk,
      reset    => reset,
      q6       => d,
      q7       => q,
      pulse1Hz => en
      );
  seg7_hex_1 : seg7_hex
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
        when x"0" => AN <= x"fe";
        when x"1" => AN <= x"fd";
        when x"2" => AN <= x"fb";
        when x"3" => AN <= x"f7";
        when x"4" => AN <= x"ef";
        when x"5" => AN <= x"df";
        when x"6" => AN <= x"bf";
        when x"7" => AN <= x"7f";
      end case;
    end if;
  end process;
  with anode_counter select
    digit <=
    q0   when x"0" ,
    q1   when x"1" ,
    q2   when x"2" ,
    q3   when x"3" ,
    q4   when x"4" ,
    q5   when x"5" ,
    q6   when x"6" ,
    q7   when x"7" ,
    x"0" when others;

end Behavioral;

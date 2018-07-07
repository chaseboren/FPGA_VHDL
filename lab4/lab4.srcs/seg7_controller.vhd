library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;
--Implements task 1 of lab 3. Takes 8 4bit inputs and displays them on the 8 digit display.
entity seg7_controller is
  port (clk   : in  std_logic;
        reset : in  std_logic;
        q0    : in  std_logic_vector (3 downto 0);--These will connect with registers in the top level design.
        q1    : in  std_logic_vector (3 downto 0);
        q2    : in  std_logic_vector (3 downto 0);
        q3    : in  std_logic_vector (3 downto 0);
        q4    : in  std_logic_vector (3 downto 0);
        q5    : in  std_logic_vector (3 downto 0);
        q6    : in  std_logic_vector (3 downto 0);
        q7    : in  std_logic_vector (3 downto 0);
        anode : out std_logic_vector(7 downto 0);--controls the digit being lit. x00 is all on, xFF is none on
        seg7  : out std_logic_vector(7 downto 0)--controls digit displayed.
        );
end seg7_controller;
architecture Behavioral of seg7_controller is
  signal max1KHz       : unsigned (26 downto 0);
  signal pulse1KHz     : std_logic;
  signal anode_counter : unsigned(2 downto 0);
  signal digit         : std_logic_vector (3 downto 0);
begin
  max1KHz <= "000000000011000011010100000";--equivalent to 10000. This gives a strobe rate of 1KHz, effective at appearing constant.
--generates a high output every
  pulse_generator_0 : entity pulse_generator
    port map (
      clk      => clk,
      reset    => reset,
      maxCount => max1KHz,
      pulseOut => pulse1Khz --use this as a 1KHz enable signal
      );
-- continuously counts up to 0-7 and rolls over.
  upCounter_0 : entity upCounter
    port map (
      clk     => clk,
      reset   => reset,
      counter => anode_counter,
      en      => pulse1KHz
      );
--takes a binary representation in and outputs a 7 segment encoded digit
  seg7_hex_0 : entity seg7_hex
    port map (
      digit => digit,
      seg7  => seg7
      );
  process(reset, anode_counter)--only needs to be sensitive to the asynchronous reset
  begin
    if (reset = '1') then--asynchronous reset
      anode <= x"fe";
    else
      case anode_counter is
        when "000"  => anode <= x"fe";--Anode must be low. Using Hex is a cleaner representation but could also be 11111110
        when "001"  => anode <= x"fd";
        when "010"  => anode <= x"fb";
        when "011"  => anode <= x"f7";
        when "100"  => anode <= x"ef";
        when "101"  => anode <= x"df";
        when "110"  => anode <= x"bf";
        when "111"  => anode <= x"7f";
        when others => anode <= x"fe";--not needed but would not synthesize without it. Could have picked a case, but I prefer to be explicit.
      end case;
    end if;
  end process;
  with anode_counter select--from up counter
    digit <=
    q0   when x"0",--send first register to seg7 encoder
    q1   when x"1",
    q2   when x"2",
    q3   when x"3",
    q4   when x"4",
    q5   when x"5",
    q6   when x"6",
    q7   when x"7",
    x"0" when others;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;


entity question1 is
  port(clk : in std_logic;              --one bit inputs
       R   : in std_logic;
       G   : in std_logic;
       C   : in std_logic;
       B   : in std_logic;

       --4 bit inputs
       A : in std_logic_vector (3 downto 0);
       F : in std_logic_vector (3 downto 0);

       --outputs
       W : out std_logic;
       Y : out std_logic_vector(3 downto 0));
end question1;

architecture arch_question1 of question1 is

  signal w_int    : std_logic;
  signal mux1_out : std_logic_vector (3 downto 0);
  signal Q        : std_logic_vector (3 downto 0);

  constant mux1_const : std_logic_vector (3 downto 0) := "1001";

begin

  process(clk, R) -- 4 bit flip flop
  begin
    if R = '1' then                     --asynchronous reset
      Q <= (others => '0');
    elsif rising_edge(clk) then
      if G = '1' then                   --acting as clock enable
        Q <= A;
      end if;
    end if;
  end process;

  w_int <= C or B;
  W     <= w_int; --can't read outputs

  Y <= mux1_out when (w_int = '0') else F; --second mux

  mux1_out <= Q when (C = '1') else mux1_const; --first mux

end architecture;

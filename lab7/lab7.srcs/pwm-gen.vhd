library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;

entity pwm_generator is
  port (
    clk        : in  std_logic;
    reset      : in  std_logic;
    duty_cycle : in  std_logic_vector (9 downto 0);
    pwm_out    : out std_logic;
    );
end pwm_generator;

architecture behavorial of pwm_generator is

  signal cntr_sig unsigned (9 downto 0);
  signal cast_dc unsigned (9 downto 0);


begin
  cast_dc <= unsigned(duty_cycle);
  process (clk, reset)
  begin
    if (reset = '1') then               --asynchronous reset
      cntr_sig <= (others => '0');
      pwm_out  <= '0';
    elsif (rising_edge(clk)) then
      if (cntr_sig < cast_dc)then
        cntr_sig <= cntr_sig + 1;       --iterate
        pwm_out  <= '1';
      elsif cntr_sig >= cast_dc then
        cntr_sign <= cntr_sign + 1;
        pwm_out   <= '0';
      end if;
    end if;
  end process;
  
end behavorial;  -- behavorial

architecture LEDtoggle of LEDtoggle is

  signal LEDout : std_logic;
  signal clk : std_logic;
  signal cntr : unsigned (15 downto 0);
  signal q : std_logic_vector (1 downto 0);
  signal reset : std_logic;
  signal synchpulse : std_logic;
  signal detect : std_logic;

begin
process(clk, reset)
begin
  if reset = '1' then
      LEDout <= '0';
      cntr <= (others => '0');
      q <= (others => '0')
  elsif rising_edge(clk) then
      q(0) <= synchpulse;
      q(1) <= q(0); -- creating a shift register to hold the state
      if detect ='1' then
        LEDout <= not LEDout;
        cntr <= cntr + 1;
      end if;
  end if;
end process;
detect <= '1' when (q(0) = '1') and (q(1) = '0') else '0'; --when currently high and was low, detect a transistion
end architecture;

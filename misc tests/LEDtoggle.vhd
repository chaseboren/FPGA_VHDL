architecture LEDtoggle of LEDtoggle is

  signal LEDout     : std_logic;
  signal clk        : std_logic;
  signal cntr       : unsigned (15 downto 0);
  signal q          : std_logic;
  signal reset      : std_logic;
  signal synchpulse : std_logic;
  signal detect     : std_logic;

begin
  process(clk, reset)
  begin
    if reset = '1' then
      LEDout <= '0';
      cntr   <= (others => '0');
      q      <= '0';
    elsif rising_edge(clk) then
      q <= synchpulse;

      if detect = '1' then
        LEDout <= not LEDout;
        cntr   <= cntr + 1;
      end if;
    end if;
  end process;
  detect <= '1' when (synchpulse = '1') and (q = '0') else '0';
end architecture;

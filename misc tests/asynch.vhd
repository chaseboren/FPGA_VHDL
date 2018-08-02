architecture pulseStretcher of pulseStretcher is

  signal clk : std_logic;
  signal asynch : std_logic;
  signal stretchedpulse : std_logic;
  signal reset : std_logic;
  signal cntr : integer range 0 to 50000;


begin
process(clk, reset)
begin
  if reset = '1' then
    cntr <= 0;
    stretchedpulse <= '0';
  elsif rising_edge(clk) then
    if asynch = '1' then
      if cntr <50000 then
        cntr <= cntr + 1;
        stretchedpulse <= '1';
      else
        cntr <= 0;
        stretchedpulse <'0';
      end if;
    elsif cntr > 0 then
      if cntr < 50000 then
        stretchedpulse <='1';
        cntr <= cntr + 1;
      else
        stretchedpulse <= '0';
        cntr <= 0;
      end if;
    end if;
  end if;

end process;
end architecture;

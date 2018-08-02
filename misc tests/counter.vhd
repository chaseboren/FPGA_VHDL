process(clk, reset)
begin
  if reset = '1' then
    cntr <= (other => '0');
  elsif rising_edge(clk) then
    if en = '1' then
      cntr <= cntr + 1;
    end if;
  end if;
end process;

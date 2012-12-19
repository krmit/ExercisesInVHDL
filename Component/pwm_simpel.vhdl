entity counter is 
port(  clock:  in bit;
  reset:  in bit;
  count:  out bit_vector(3 downto 0)
);
end counter;

architecture behav of counter is         
  signal pre_count: bit_vector(3 downto 0);
  begin
    process(clock, enable, reset)
    begin
      if reset = '1' then
        pre_count <= "0000";
      elsif (clock='1' and clock'event) then
          pre_count <= pre_count + "1";
      end if;
    end process;  
    count <= pre_count;
end behav;
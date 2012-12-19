library ieee ;
use ieee.std_logic_1164.all;

entity counter is 
port(  clock:  in bit;
  reset:  in bit;
  count:  out std_logic_vector(3 downto 0)
);
end counter;

architecture behav of counter is         
  signal pre_count: std_logic_vector(3 downto 0);
  begin
    process(clock, reset)
    begin
      if reset = '1' then
        pre_count <= "0000";
      elsif (clock='1' and clock'event) then
          pre_count <= pre_count + "1";
      end if;
    end process;  
    count <= pre_count;
end behav;
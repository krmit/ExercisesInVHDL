  library IEEE;                 
  use IEEE.std_logic_1164.all;  
  
  entity flipFlop is           
     port (                     
        clock: in STD_LOGIC;           
          Q : out STD_LOGIC :='0'   
     );
  end flipFlop;
 
  architecture behaviour of flipFlop is  
  signal state : std_logic :='1';                                 
 
  begin
      process(clock)               
      begin
          if rising_edge(clock) then
				state <= not state;	
                Q <= state;         
          end if;                 
      end process;
  end behaviour;                  
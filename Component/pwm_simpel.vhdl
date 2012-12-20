library IEEE;                 
use IEEE.std_logic_1164.all;  

entity pwm_simpel is 
port(  clock:  in STD_LOGIC;
       enable: in STD_LOGIC;
       Puls:  out STD_LOGIC
);
end pwm_simpel;

architecture behavior of pwm_simpel is

--Your internal signal here
signal s0,s1, s2, s3 : STD_LOGIC:='0';
begin

		FF0 : entity work.flipFlop port map(clock,s0);
		FF1 : entity work.flipFlop port map(s0,s1);
		FF2 : entity work.flipFlop port map(s1,s2);
		FF3 : entity work.flipFlop port map(s2,s3);
		
		Puls <= s3 and enable;

end;
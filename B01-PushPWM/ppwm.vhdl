LIBRARY work;
USE work.all;
library IEEE;                 
use IEEE.std_logic_1164.all;

--Declarations of in and out signals
entity ppwm is
port (a : in STD_LOGIC ;
      b : in STD_LOGIC ;
      c : in STD_LOGIC ;
      clock : in STD_LOGIC ;
      Puls : out STD_LOGIC 
      );
end ppwm;

--Declaration of  architecture.
architecture behavior of ppwm is

--Your internal signal here
signal s0,s1 : STD_LOGIC :='0';
begin
--Your code here!

s0 <= (a and b) and c;
PWM1 : entity work.pwm_simpel port map(clock,s0,Puls);

end;
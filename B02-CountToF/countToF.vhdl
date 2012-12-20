LIBRARY work;
USE work.all;
library IEEE;                 
use IEEE.std_logic_1164.all;  

--Declarations of in and out signals
entity countToF is
port (
      clock  : in STD_LOGIC;
      Status : out STD_LOGIC
      );
end countToF;

--Declaration of  architecture.
architecture behavior of countToF is

--Your internal signal here
signal s0,s1, s2, s3 : STD_LOGIC:='0';
begin
--Your code here!

   FF0 : entity work.flipFlop port map(clock,s0);
   FF1 : entity work.flipFlop port map(s0,s1);
   FF2 : entity work.flipFlop port map(s1,s2);
   FF3 : entity work.flipFlop port map(s2,s3);
   FF4 : entity work.flipFlop port map(s3,Status);

end;
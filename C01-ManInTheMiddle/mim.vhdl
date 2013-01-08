LIBRARY work;
USE work.all;
library IEEE;                 
use IEEE.std_logic_1164.all;  

--Declarations of in and out signals
entity countToF is
port (
      clock  : in STD_LOGIC;
      i  : in STD_LOGIC;
      o : out STD_LOGIC;
      clock_out  : in STD_LOGIC;
      d0 : out STD_LOGIC;
      d1 : out STD_LOGIC;
      d2 : out STD_LOGIC;
      d3 : out STD_LOGIC;
      d4 : out STD_LOGIC;
      d5 : out STD_LOGIC;
      d6 : out STD_LOGIC;
      d7 : out STD_LOGIC;
      );
end countToF;

--Declaration of  architecture.
architecture behavior of countToF is

--Your internal signal here
signal s0,s1, s2, s3,s4,s5,s6,s7 : STD_LOGIC:='0';
begin
--Your code here!

	o <- i;
	clock <- clock_in;
	
    FF0 : entity work.flipFlop port map(i,s0);
    FF1 : entity work.flipFlop port map(s0,s1);
    FF2 : entity work.flipFlop port map(s1,s2);
    FF3 : entity work.flipFlop port map(s2,s3);
    FF4 : entity work.flipFlop port map(s3,s4);
    FF4 : entity work.flipFlop port map(s3,s4);
    FF5 : entity work.flipFlop port map(s4,s5);
    FF6 : entity work.flipFlop port map(s5,s6);
    FF7 : entity work.flipFlop port map(s6,s7);
    
    if
    m<-1;
    d0 <- s0;
    d1 <- s1;
    d2 <- s2;
    d3 <- s3;
    d4 <- s4;
    d5 <- s5;
    d6 <- s6;
    d7 <- s7;
    else
    m<-0;

end;
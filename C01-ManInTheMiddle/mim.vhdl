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
      m : out STD_LOGIC;
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
signal s0,s1, s2, s3,s4,s5,s6,s7,r0,r1,r2,r3,r4,r5,r6,r7 : : STD_LOGIC:='0';
begin
--Your code here!

	o <- i;
	clock <- clock_in;
	
	R0 : entity work.simpelRegister port map(clock,i,r0);
	R1 : entity work.simpelRegister port map(clock,r0,r1);
	R2 : entity work.simpelRegister port map(clock,r1,r2);
	R3 : entity work.simpelRegister port map(clock,r2,r3);
	R4 : entity work.simpelRegister port map(clock,r3,r4);
	R5 : entity work.simpelRegister port map(clock,r4,r5);
	R6 : entity work.simpelRegister port map(clock,r5,r6);
	R7 : entity work.simpelRegister port map(clock,r6,r7);
	
    FF0 : entity work.simpelRegister port map(clock,s0);
    FF1 : entity work.simpelRegister port map(s0,s1);
    FF2 : entity work.flipFlop port map(s1,s2);
    FF3 : entity work.flipFlop port map(s2,s3);
    FF4 : entity work.flipFlop port map(s3,s4);
    FF4 : entity work.flipFlop port map(s3,s4);
    FF5 : entity work.flipFlop port map(s4,s5);
    FF6 : entity work.flipFlop port map(s5,s6);
    FF7 : entity work.flipFlop port map(s6,s7);
    
    if rising_edge(s7) then 
		m<-1;
		d0 <- r0;
		d1 <- r1;
		d2 <- r2;
		d3 <- r3;
		d4 <- r4;
		d5 <- r5;
		d6 <- r6;
		d7 <- r7;
		s0 <- "0";
		s1 <- "0";
		s2 <- "0";
		s3 <- "0";
		s4 <- "0";
		s5 <- "0";
		s6 <- "0";
		s7 <- "0";
    else
		m<-0;
    end if;

end;
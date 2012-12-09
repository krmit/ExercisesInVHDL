LIBRARY work;
USE work.all;

--Declarations of in and out signals
entity andand is
port (a : in bit;
      b : in bit;
      c : in bit;
      d : in bit;
      AndAll : out bit
      );
end andand;

--Declaration of  architecture.
architecture behavior of andand is

--Your internal signal here
signal s0,s1: bit:='0';
begin
--Your code here!
	s0 <= a and b;
	s1 <= c and d;
	AndAll <= s0 and s1;
end;
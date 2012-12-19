LIBRARY work;
USE work.all;

--Declarations of in and out signals
entity adder is
port (a0 : in bit;
      a1 : in bit;
      b0 : in bit;
      b1 : in bit;
      Sum0 : out bit;
      Sum1 : out bit;
      Carry : out bit
      );
end adder;

--Declaration of  architecture.
architecture behavior of adder is

--Your internal signal here
signal s0,s1,c0,c1,c2: bit:='0';
begin
--Your code here!

HA1 : entity work.halfadder port map(a0,b0,Sum0,c0);

HA2 : entity work.halfadder port map(a1,b1,s1,c1);
HA3 : entity work.halfadder port map(s1,c0,Sum1,c2);
Carry <= c1 or c2;  --final carry calculation

end;
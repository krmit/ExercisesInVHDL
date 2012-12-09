LIBRARY work;
USE work.all;

--top module(full adder) entity declaration
entity fulladder is
port (a : in bit;
      b : in bit;
      carry_in : in bit;
      sum : out bit;
      carry : out bit
      );
end fulladder;

 --top module architecture declaration.
architecture behavior of fulladder is
signal s1,c1,c2 : bit:='0';
begin
--instantiate and do port map for the first half adder.
HA1 : entity work.halfadder port map(a,b,s1,c1);
--instantiate and do port map for the second half adder.
HA2 : entity work.halfadder port map(s1,carry_in,sum,c2);
carry <= c1 or c2;  --final carry calculation

end;
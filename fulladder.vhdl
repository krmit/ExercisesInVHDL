library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--top module(full adder) entity declaration
entity fulladder is
port (a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      sum : out std_logic;
      carry : out std_logic
      );
end fulladder;
 --top module architecture declaration.
architecture behavior of fulladder is
signal s1,c1,c2 : std_logic:='0';
begin
--instantiate and do port map for the first half adder.
HA1 : entity work.halfadder port map(a,b,s1,c1);
--instantiate and do port map for the second half adder.
HA2 : entity work.halfadder port map(s1,cin,sum,c2);
carry <= c1 or c2;  --final carry calculation

end;
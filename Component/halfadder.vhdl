entity halfadder is
Port ( a : in  bit;
      b : in  bit;
      sum : out  bit;
      carry : out  bit
     );
end halfadder;

architecture Behavioral of halfadder is
begin
sum <= a xor b;
carry <= a and b;
end Behavioral;
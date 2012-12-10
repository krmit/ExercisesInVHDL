LIBRARY work;
USE work.all;

--Declarations of in and out signals
entity aoa is
port (a : in bit;
      b : in bit;
      c : in bit;
      d : in bit;
      Product : out bit
      );
end aoa;

--Declaration of  architecture.
architecture behavior of aoa is

--Your internal signal here
signal s0,s1: bit:='0';
begin
--Your code here!

end;
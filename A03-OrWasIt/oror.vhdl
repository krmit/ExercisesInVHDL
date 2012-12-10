LIBRARY work;
USE work.all;

--Declarations of in and out signals
entity oror is
port (a : in bit;
      b : in bit;
      c : in bit;
      d : in bit;
      OrAll : out bit
      );
end oror;

--Declaration of  architecture.
architecture behavior of oror is

--Your internal signal here
signal s0,s1: bit:='0';
begin
--Your code here!

end;
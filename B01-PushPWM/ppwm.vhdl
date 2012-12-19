LIBRARY work;
USE work.all;

--Declarations of in and out signals
entity ppwm is
port (a : in bit;
      b : in bit;
      c : in bit;
      clock : in bit;
      Puls : out bit
      );
end ppwm;

--Declaration of  architecture.
architecture behavior of ppwm is

--Your internal signal here
signal s0,s1 bit:='0';
begin
--Your code here!

PWM1 : entity work.pwm_simpel port map(clock,(a and b) and c,Puls);

end;
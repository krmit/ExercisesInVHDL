     --  A testbench has no ports.
     entity ppwm_tb is
     end ppwm_tb;
     
     architecture behav of ppwm_tb is
        --  Declaration of the component that will be instantiated.
        component ppwm
          port (a,b,c,clock : in bit; Puls : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for ppwm_0: ppwm use entity work.ppwm;
        signal a,b,c,clock,Puls : bit;
     begin
        --  Component instantiation.
        ppwm_0: ppwm port map (a => a, b => b, c => c, clock => clock,
                                 Puls => Puls);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the ppwm.
              a,b,c,clock : bit;
              --  The expected outputs of the ppwm.
              Puls  : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0'),
              ('1', '1', '1', '0', '0'),
              ('1', '1', '1', '1', '0')
              );
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              a <= patterns(i).a;
              b <= patterns(i).b;
              c <= patterns(i).c;
              clock <= patterns(i).clock;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert Puls = patterns(i).Puls
                 report "bad result for puls" severity error;                
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

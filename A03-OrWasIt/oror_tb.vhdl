     --  A testbench has no ports.
     entity oror_tb is
     end oror_tb;
     
     architecture behav of oror_tb is
        --  Declaration of the component that will be instantiated.
        component oror
          port (a, b,c,d : in bit; orAll : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for adder_0: oror use entity work.oror;
        signal a, b, c, d, OrAll : bit;
     begin
        --  Component instantiation.
        adder_0: oror port map (a => a, b => b, c => c,
                                 d => d, OrAll => OrAll);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the adder.
              a, b, c, d : bit;
              --  The expected outputs of the adder.
              OrAll : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '1'),
              ('0', '0', '1', '0', '1'),
              ('0', '0', '1', '1', '1'),
              ('0', '1', '0', '0', '1'),
              ('0', '1', '0', '1', '1'),
              ('0', '1', '1', '0', '1'),
              ('0', '1', '1', '1', '1'),
              ('1', '0', '0', '0', '1'),
              ('1', '0', '0', '1', '1'),
              ('1', '0', '1', '0', '1'),
              ('1', '0', '1', '1', '1'),
              ('1', '1', '0', '0', '1'),
              ('1', '1', '0', '1', '1'),
              ('1', '1', '1', '0', '1'),
              ('1', '1', '1', '1', '1'));
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              a <= patterns(i).a;
              b <= patterns(i).b;
              c <= patterns(i).c;
              d <= patterns(i).d;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert OrAll = patterns(i).OrAll
                 report "bad result from and" severity error;
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

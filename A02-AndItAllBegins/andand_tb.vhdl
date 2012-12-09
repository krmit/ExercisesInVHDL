     --  A testbench has no ports.
     entity andand_tb is
     end andand_tb;
     
     architecture behav of andand_tb is
        --  Declaration of the component that will be instantiated.
        component andand
          port (a, b,c,d : in bit; AndAll : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for adder_0: andand use entity work.andand;
        signal a, b, c, d, AndAll : bit;
     begin
        --  Component instantiation.
        adder_0: andand port map (a => a, b => b, c => c,
                                 d => d, AndAll => AndAll);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the adder.
              a, b, c, d : bit;
              --  The expected outputs of the adder.
              AndAll : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0'),
              ('0', '0', '1', '0', '0'),
              ('0', '0', '1', '1', '0'),
              ('0', '1', '0', '0', '0'),
              ('0', '1', '0', '1', '0'),
              ('0', '1', '1', '0', '0'),
              ('0', '1', '1', '1', '0'),
              ('1', '0', '0', '0', '0'),
              ('1', '0', '0', '1', '0'),
              ('1', '0', '1', '0', '0'),
              ('1', '0', '1', '1', '0'),
              ('1', '1', '0', '0', '0'),
              ('1', '1', '0', '1', '0'),
              ('1', '1', '1', '0', '0'),
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
              assert AndAll = patterns(i).AndAll
                 report "bad result from and" severity error;
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

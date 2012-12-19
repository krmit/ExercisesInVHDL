     --  A testbench has no ports.
     entity adder_tb is
     end adder_tb;
     
     architecture behav of adder_tb is
        --  Declaration of the component that will be instantiated.
        component adder
          port (a0, a1,b0,b1 : in bit; Sum0,Sum1,Carry : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for adder_0: adder use entity work.adder;
        signal a0,a1,b0,b1,Sum0,Sum1,Carry : bit;
     begin
        --  Component instantiation.
        adder_0: adder port map (a0 => a0, a1 => a1, b0 => b0, b1 => b1,
                                 Sum0 => Sum0, Sum1 => Sum1, Carry => Carry);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the adder.
              a0,a1,b0,b1 : bit;
              --  The expected outputs of the adder.
              Sum0,Sum1,Carry  : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0', '0', '0'),
              ('0', '0', '0', '1', '0', '1', '0'),
              ('0', '0', '1', '0', '1', '0', '0'),
              ('0', '0', '1', '1', '1', '1', '0'),
              ('0', '1', '0', '0', '0', '1', '0'),
              ('0', '1', '0', '1', '0', '0', '1'),
              ('0', '1', '1', '0', '1', '1', '0'),
              ('0', '1', '1', '1', '1', '0', '1'),
              ('1', '0', '0', '0', '1', '0', '0'),
              ('1', '0', '0', '1', '1', '1', '0'),
              ('1', '0', '1', '0', '0', '1', '0'),
              ('1', '0', '1', '1', '0', '0', '1'),
              ('1', '1', '0', '0', '1', '1', '0'),
              ('1', '1', '0', '1', '1', '0', '1'),
              ('1', '1', '1', '0', '0', '0', '1'),
              ('1', '1', '1', '1', '0', '1', '1'));
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              a0 <= patterns(i).a0;
              a1 <= patterns(i).a1;
              b0 <= patterns(i).b0;
              b1 <= patterns(i).b1;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert Sum0 = patterns(i).Sum0
                 report "bad result for Sum0" severity error;
              assert Sum1 = patterns(i).Sum1
                 report "bad result for Sum1" severity error;
              assert Carry = patterns(i).Carry
                 report "bad result for Carry" severity error;                 
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

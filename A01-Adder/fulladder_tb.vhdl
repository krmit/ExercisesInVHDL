     --  A testbench has no ports.
     entity fulladder_tb is
     end fulladder_tb;
     
     architecture behav of fulladder_tb is
        --  Declaration of the component that will be instantiated.
        component fulladder
          port (a, b : in bit; carry_in : in bit; sum : out bit; carry : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for adder_0: fulladder use entity work.fulladder;
        signal a, b, carry_in, sum, carry : bit;
     begin
        --  Component instantiation.
        adder_0: fulladder port map (a => a, b => b, carry_in => carry_in,
                                 sum => sum, carry => carry);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the adder.
              i0, i1, ci : bit;
              --  The expected outputs of the adder.
              s, co : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0'),
              ('0', '0', '1', '1', '0'),
              ('0', '1', '0', '1', '0'),
              ('0', '1', '1', '0', '1'),
              ('1', '0', '0', '1', '0'),
              ('1', '0', '1', '0', '1'),
              ('1', '1', '0', '0', '1'),
              ('1', '1', '1', '1', '1'));
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              a <= patterns(i).i0;
              b <= patterns(i).i1;
              carry_in <= patterns(i).ci;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert sum = patterns(i).s
                 report "bad sum value" severity error;
              assert carry = patterns(i).co
                 report "bad carray out value" severity error;
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

       library IEEE;                 
       use IEEE.std_logic_1164.all;  
     
     --  A testbench has no ports.
     entity countToF_tb is
     end countToF_tb;
     
     architecture behav of countToF_tb is
        --  Declaration of the component that will be instantiated.
        component countToF
          port (clock : in STD_LOGIC; Status : out STD_LOGIC);
        end component;
        --  Specifies which entity is bound with the component.
        for countToF_0: countToF use entity work.countToF;
        signal clock,Status : bit;
     begin
        --  Component instantiation.
        countToF_0: countToF port map (clock => clock,
                                       Status => Status);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the countToF.
              clock : bit;
              --  The expected outputs of the countToF.
              Status  : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '1'),
              ('1', '1'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0'),
              ('0', '0'),
              ('1', '0')
              );
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              clock <= patterns(i).clock;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert Status = patterns(i).Status
                 report "bad result for Status" severity error;                
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;

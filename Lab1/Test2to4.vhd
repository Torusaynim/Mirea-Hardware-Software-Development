LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
 
ENTITY Test2to4 IS
END Test2to4;
 
ARCHITECTURE behavior OF Test2to4 IS 
 
 
    COMPONENT Decoder2to4withE
    PORT(
         a1 : IN  std_logic;
         a0 : IN  std_logic;
         e : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a1 : std_logic := '0';
   signal a0 : std_logic := '0';
   signal e : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder2to4withE PORT MAP (
          a1 => a1,
          a0 => a0,
          e => e,
          q => q
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      -- wait for 10 ns;

		for k in std_logic range '0' to '1' loop
			for i in std_logic range '0' to '1' loop
				for j in std_logic range '0' to '1' loop
					e <= k;
					a1 <= i;
					a0 <= j;
					wait for 10 ns;
				end loop;
			end loop;
		end loop;
		

      wait;
   end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
 
ENTITY Test4to16 IS
END Test4to16;
 
ARCHITECTURE behavior OF Test4to16 IS 
 
 
    COMPONENT Decoder4to16withE
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         e : IN  std_logic;
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal e : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0); 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder4to16withE PORT MAP (
          a => a,
          e => e,
          q => q
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      -- wait for 10 ns;	
		e <= '0';
		for i in 0 to 15 loop
			a <= std_logic_vector(to_unsigned(i,4));
			wait for 5 ns;
		end loop;
		
		e <= '1';
		for i in 0 to 15 loop
			a <= std_logic_vector(to_unsigned(i,4));
			wait for 5 ns;
		end loop;
		
      wait;
   end process;

END;

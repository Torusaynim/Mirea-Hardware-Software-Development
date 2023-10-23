LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY TestAlignModule IS
END TestAlignModule;

ARCHITECTURE behavior OF TestAlignModule IS 


  COMPONENT AlignModule
  PORT(
       expb : IN  std_logic_vector(3 downto 0);
       exps : IN  std_logic_vector(3 downto 0);
       fracs : IN  std_logic_vector(7 downto 0);
       fraca : OUT  std_logic_vector(7 downto 0)
      );
  END COMPONENT;


  --Inputs
  signal expb : std_logic_vector(3 downto 0) := (others => '0');
  signal exps : std_logic_vector(3 downto 0) := (others => '0');
  signal fracs : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
  signal fraca : std_logic_vector(7 downto 0);


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  uut: AlignModule PORT MAP (
        expb => expb,
        exps => exps,
        fracs => fracs,
        fraca => fraca
      );


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 10 ns.
    -- wait for 10 ns;	

    -- Случай 1: Проверка выравнивания порядков.
    exps <= "1000";
    expb <= "1010";
    fracs <= "10000011";
    wait for 10 ns;

    wait;
  end process;

END;

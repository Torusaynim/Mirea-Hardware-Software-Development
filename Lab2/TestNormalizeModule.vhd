LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY TestNormalizeModule IS
END TestNormalizeModule;
 
ARCHITECTURE behavior OF TestNormalizeModule IS 


  COMPONENT NormalizeModule
  PORT(
       sum : IN  std_logic_vector(8 downto 0);
       expb : IN  std_logic_vector(3 downto 0);
       expn : OUT  std_logic_vector(3 downto 0);
       fracn : OUT  std_logic_vector(7 downto 0)
      );
  END COMPONENT;


  --Inputs
  signal sum : std_logic_vector(8 downto 0) := (others => '0');
  signal expb : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
  signal expn : std_logic_vector(3 downto 0);
  signal fracn : std_logic_vector(7 downto 0);


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  uut: NormalizeModule PORT MAP (
        sum => sum,
        expb => expb,
        expn => expn,
        fracn => fracn
      );


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 10 ns.
    -- wait for 10 ns;	

    -- Случай 1: Нормализация не нужна.
    sum <= "010001010";
    expb <= "1010";
    wait for 10 ns;
    
    -- Случай 2: Нужно смещение мантиссы влево с уменьшением порядка.
    sum <= "001000101";
    expb <= "1010";
    wait for 10 ns;
    
    -- Случай 3: Нужно смещение мантиссы вправо с увеличением порядка.
    sum <= "100001010";
    expb <= "1010";
    wait for 10 ns;

    wait;
  end process;

END;

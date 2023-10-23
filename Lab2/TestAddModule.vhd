LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY TestAddModule IS
END TestAddModule;

ARCHITECTURE behavior OF TestAddModule IS 


  COMPONENT AddModule
  PORT(
       signb : IN  std_logic;
       signs : IN  std_logic;
       fracb : IN  std_logic_vector(7 downto 0);
       fraca : IN  std_logic_vector(7 downto 0);
       sum : OUT  std_logic_vector(8 downto 0)
      );
  END COMPONENT;


  --Inputs
  signal signb : std_logic := '0';
  signal signs : std_logic := '0';
  signal fracb : std_logic_vector(7 downto 0) := (others => '0');
  signal fraca : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
  signal sum : std_logic_vector(8 downto 0);


BEGIN

	-- Instantiate the Unit Under Test (UUT)
  uut: AddModule PORT MAP (
        signb => signb,
        signs => signs,
        fracb => fracb,
        fraca => fraca,
        sum => sum
      );


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 10 ns.
    -- wait for 10 ns;	

    -- Случай 1: Сложение положительных чисел.
    signb <= '0';
    signs <= '0';
    fracb <= "10010000";
    fraca <= "10100111";
    wait for 10 ns;
    
    -- Случай 2: Сложение отрицательных чисел.
    signb <= '1';
    signs <= '1';
    fracb <= "10010000";
    fraca <= "10100111";
    wait for 10 ns;
    
    -- Случай 3: Вычитание чисел с разным знаком.
    signb <= '0';
    signs <= '1';
    fracb <= "10100110";
    fraca <= "00000110";
    wait for 10 ns;

    wait;
  end process;

END;

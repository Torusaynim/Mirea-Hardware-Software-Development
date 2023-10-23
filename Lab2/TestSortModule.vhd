LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY TestSortModule IS
END TestSortModule;

ARCHITECTURE behavior OF TestSortModule IS 


  COMPONENT SortModule
  PORT(
       sign1 : IN  std_logic;
       sign2 : IN  std_logic;
       exp1 : IN  std_logic_vector(3 downto 0);
       exp2 : IN  std_logic_vector(3 downto 0);
       frac1 : IN  std_logic_vector(7 downto 0);
       frac2 : IN  std_logic_vector(7 downto 0);
       signb : OUT  std_logic;
       signs : OUT  std_logic;
       expb : OUT  std_logic_vector(3 downto 0);
       exps : OUT  std_logic_vector(3 downto 0);
       fracb : OUT  std_logic_vector(7 downto 0);
       fracs : OUT  std_logic_vector(7 downto 0)
      );
  END COMPONENT;


  --Inputs
  signal sign1 : std_logic := '0';
  signal sign2 : std_logic := '0';
  signal exp1 : std_logic_vector(3 downto 0) := (others => '0');
  signal exp2 : std_logic_vector(3 downto 0) := (others => '0');
  signal frac1 : std_logic_vector(7 downto 0) := (others => '0');
  signal frac2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
  signal signb : std_logic;
  signal signs : std_logic;
  signal expb : std_logic_vector(3 downto 0);
  signal exps : std_logic_vector(3 downto 0);
  signal fracb : std_logic_vector(7 downto 0);
  signal fracs : std_logic_vector(7 downto 0);


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  uut: SortModule PORT MAP (
        sign1 => sign1,
        sign2 => sign2,
        exp1 => exp1,
        exp2 => exp2,
        frac1 => frac1,
        frac2 => frac2,
        signb => signb,
        signs => signs,
        expb => expb,
        exps => exps,
        fracb => fracb,
        fracs => fracs
      );


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 10 ns.
    -- wait for 10 ns;	

    -- Случай 1: Первое число больше по порядку.
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1010";
    exp2 <= "1001";
    frac1 <= "10000100";
    frac2 <= "10111010";
    wait for 10 ns;

    -- Случай 2: Второе число больше по порядку.
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1001";
    exp2 <= "1010";
    frac1 <= "10111010";
    frac2 <= "10000100";
    wait for 10 ns;
    
    -- Случай 3: Порядок одинаковый, первое число больше.
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1010";
    exp2 <= "1010";
    frac1 <= "10111010";
    frac2 <= "10000100";
    wait for 10 ns;
    
    -- Случай 4: Порядок одинаковый, второе число больше.
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1010";
    exp2 <= "1010";
    frac1 <= "10000100";
    frac2 <= "10111010";
    wait for 10 ns;

    wait;
  end process;

END;

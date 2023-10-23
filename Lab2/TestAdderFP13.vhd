LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY TestAdderFP13 IS
END TestAdderFP13;

ARCHITECTURE behavior OF TestAdderFP13 IS 


  COMPONENT AdderFP13
  PORT(
       sign1 : IN  std_logic;
       sign2 : IN  std_logic;
       exp1 : IN  std_logic_vector(3 downto 0);
       exp2 : IN  std_logic_vector(3 downto 0);
       frac1 : IN  std_logic_vector(7 downto 0);
       frac2 : IN  std_logic_vector(7 downto 0);
       sign_out : OUT  std_logic;
       exp_out : OUT  std_logic_vector(3 downto 0);
       frac_out : OUT  std_logic_vector(7 downto 0)
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
  signal sign_out : std_logic;
  signal exp_out : std_logic_vector(3 downto 0);
  signal frac_out : std_logic_vector(7 downto 0);


BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
  uut: AdderFP13 PORT MAP (
        sign1 => sign1,
        sign2 => sign2,
        exp1 => exp1,
        exp2 => exp2,
        frac1 => frac1,
        frac2 => frac2,
        sign_out => sign_out,
        exp_out => exp_out,
        frac_out => frac_out
      );


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 10 ns.
    -- wait for 10 ns;	

    -- Случай 1: Сложение двух чисел одного знака.
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1001";
    exp2 <= "1010";
    frac1 <= "10000100";
    frac2 <= "10111010";
    wait for 10 ns;

    -- Случай 2: Сложение двух чисел разных знаков.
    sign1 <= '1';
    sign2 <= '0';
    exp1 <= "0110";
    exp2 <= "1010";
    frac1 <= "10101000";
    frac2 <= "11101000";
    wait for 10 ns;

    -- Случай 3: Сложение с учетом переноса бита в старший разряд (порядок числа увеличивается).
    sign1 <= '0';
    sign2 <= '0';
    exp1 <= "1010";
    exp2 <= "1010";
    frac1 <= "10010010";
    frac2 <= "10011011";
    wait for 10 ns;

    -- Случай 4: Сложение, при котором в мантиссе появляются ведущие нули (порядок необходимо уменьшить).
    sign1 <= '1';
    sign2 <= '0';
    exp1 <= "1001";
    exp2 <= "1010";
    frac1 <= "10000100";
    frac2 <= "10111010";
    wait for 10 ns;

    wait;
  end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.numeric_std.ALL;

ENTITY stack_tb IS
END stack_tb;

ARCHITECTURE behavior OF stack_tb IS 
  --Inputs and outputs
  signal Clk,reset,Enable,PUSH_barPOP,Stack_Full,Stack_Empty : std_logic := '0';
  signal Data_In,Data_Out : std_logic_vector(7 downto 0) := (others => '0');
  --temporary signals
  signal i : integer := 0;
  -- Clock period definitions
  constant Clk_period : time := 10 ns;

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: entity work.stack PORT MAP (
        Clk => Clk,
        reset => reset,
        Enable => Enable,
        Data_In => Data_In,
        Data_Out => Data_Out,
        PUSH_barPOP => PUSH_barPOP,
        Stack_Full => Stack_Full,
        Stack_Empty => Stack_Empty
      );

  -- Clock process definitions
  Clk_process :process
  begin
    Clk <= '0';
    wait for Clk_period/2;
    Clk <= '1';
    wait for Clk_period/2;
  end process;

  -- Stimulus process
  stim_proc: process
  begin        
    reset <= '1';  --Сброс стека перед включением
    wait for clk_period;
    reset <= '0';
    Enable <= '1';  --Включение стека
    PUSH_barPOP <= '1'; --PUSH
    for i in 0 to 4 loop --PUSH чисел от 0 до 4 в стек
      Data_In <= conv_std_logic_vector(i,8);
      wait for clk_period;
    end loop;   
    PUSH_barPOP <= '0';  --POP
    for i in 0 to 4 loop  --POP 5 элементов из стека
      wait for clk_period;
    end loop;   
    Enable <= '0'; --Выключение стека

    wait;
  end process;

END;

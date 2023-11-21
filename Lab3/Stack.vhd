library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stack is
port(   Clk : in std_logic;
        Reset : in std_logic; --Сброс стека   
        Enable : in std_logic;  --Разрешающий вход, ввод/вывод не работают при 0
        Data_In : in std_logic_vector(7 downto 0);  --Вход стека
        Data_Out : out std_logic_vector(7 downto 0);  --Выход стека
        PUSH_barPOP : in std_logic;  --Команда для стека: 0 POP, 1 PUSH
        Stack_Full : out std_logic;  --Флаг если стек полный
        Stack_Empty : out std_logic  --Флаг если стек пустой
        );
end stack;

architecture Behavioral of stack is

type mem_type is array (0 to 3) of std_logic_vector(7 downto 0);
signal stack_mem : mem_type := (others => (others => '0'));
signal full,empty : std_logic := '0';
signal prev_PP : std_logic := '0';
signal SP : integer := 0; 

begin

Stack_Full <= full; 
Stack_Empty <= empty;

PUSH : process(Clk,reset)
variable stack_ptr : integer := 3;
begin
  if(reset = '1') then
    stack_ptr := 3;
    full <= '0';
    empty <= '1';
    Data_out <= (others => '0');
    prev_PP <= '0';
  elsif(rising_edge(Clk)) then
    if(Enable = '1') then
      prev_PP <= PUSH_barPOP; 
    else
      prev_PP <= '0';
    end if;   
    
    --Команда POP
    if (Enable = '1' and PUSH_barPOP = '0' and empty = '0') then           
      if(stack_ptr = 3) then
        full <= '0';
        empty <= '1';
      else
        full <= '0';
        empty <= '0';
      end if;
      if(prev_PP = '1' and full = '0') then
        stack_ptr := stack_ptr + 1;
      end if;               
      Data_Out <= stack_mem(stack_ptr);
      if(stack_ptr /= 3) then   
        stack_ptr := stack_ptr + 1;
      end if;         
    end if;
    
    --Команда PUSH
    if (Enable = '1' and PUSH_barPOP = '1' and full = '0') then
      if(stack_ptr = 0) then
        full <= '1';
        empty <= '0';
      else
        full <= '0';
        empty <= '0';
      end if; 
      if(prev_PP = '0' and empty = '0') then
        stack_ptr := stack_ptr - 1;
      end if;      
      stack_mem(stack_ptr) <= Data_In; 
      if(stack_ptr /= 0) then
        stack_ptr := stack_ptr - 1;
      end if;     
    end if;
    
    SP <= stack_ptr;
      
  end if; 
end process;

end Behavioral;

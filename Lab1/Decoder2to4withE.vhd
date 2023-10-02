library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder2to4withE is
    Port ( a1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           e : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end Decoder2to4withE;

architecture Behavioral of Decoder2to4withE is

begin
	q(0) <= e and not a1 and not a0;
	q(1) <= e and not a1 and a0;
	q(2) <= e and a1 and not a0;
	q(3) <= e and a1 and a0;


end Behavioral;


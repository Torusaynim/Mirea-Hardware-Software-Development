library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder4to16withE is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           e : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end Decoder4to16withE;

architecture Behavioral of Decoder4to16withE is
	signal p : STD_LOGIC_VECTOR (15 downto 0);
begin
	U1 : entity work.Decoder3to8withE port map (a => a(2 downto 0), e => (not a(3)), q => p(7 downto 0));
	U2 : entity work.Decoder3to8withE port map (a => a(2 downto 0), e => a(3), q => p(15 downto 8));
	q <= "0000000000000000" when (e = '0') else
		  p;

end Behavioral;


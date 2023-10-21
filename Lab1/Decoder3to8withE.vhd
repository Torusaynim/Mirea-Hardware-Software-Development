library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder3to8withE is
  Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
         e : in  STD_LOGIC;
         q : out  STD_LOGIC_VECTOR (7 downto 0));
end Decoder3to8withE;

architecture Behavioral of Decoder3to8withE is
  signal p : STD_LOGIC_VECTOR (7 downto 0);
begin
  
  U1 : entity work.Decoder2to4withE port map (a1 => a(1), a0 => a(0), e => (not a(2)), q => p(3 downto 0));
  U2 : entity work.Decoder2to4withE port map (a1 => a(1), a0 => a(0), e => a(2), q => p(7 downto 4));
  q <= "00000000" when (e = '0') else p;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SortModule is
  Port (
    sign1, sign2 : in std_logic;
    exp1, exp2 : in std_logic_vector(3 downto 0);
    frac1, frac2 : in std_logic_vector(7 downto 0);
    signb, signs : out std_logic;
    expb, exps : out std_logic_vector(3 downto 0);
    fracb, fracs : out std_logic_vector(7 downto 0)
  );
end SortModule;

architecture Behavioral of SortModule is
begin
  process (sign1, sign2, exp1, exp2, frac1, frac2)
  begin
    if ((exp1 & frac1) > (exp2 & frac2)) then
      signb <= sign1;
      signs <= sign2;
      expb <= exp1;
      exps <= exp2;
      fracb <= frac1;
      fracs <= frac2;
    else
      signb <= sign2;
      signs <= sign1;
      expb <= exp2;
      exps <= exp1;
      fracb <= frac2;
      fracs <= frac1;
    end if;
  end process;
end Behavioral;

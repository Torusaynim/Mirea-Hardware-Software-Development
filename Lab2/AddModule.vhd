library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AddModule is
  Port (
    signb, signs : in std_logic;
    fracb, fraca : in std_logic_vector(7 downto 0);
    sum : out std_logic_vector(8 downto 0)
  );
end AddModule;

architecture Behavioral of AddModule is
  signal ub_fracb, ub_fraca, ub_sum : unsigned(8 downto 0);
begin
  ub_fracb <= "0" & unsigned(fracb);
  ub_fraca <= "0" & unsigned(fraca);

  process (signb, signs, ub_fracb, ub_fraca)
  begin
    if signb = signs then
      ub_sum <= ub_fracb + ub_fraca;
    else
      ub_sum <= ub_fracb - ub_fraca;
    end if;
  end process;

  sum <= std_logic_vector(ub_sum);
end Behavioral;

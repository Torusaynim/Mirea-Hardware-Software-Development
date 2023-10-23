library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AlignModule is
  Port (
    expb, exps : in std_logic_vector(3 downto 0);
    fracs : in std_logic_vector(7 downto 0);
    fraca : out std_logic_vector(7 downto 0)
  );
end AlignModule;

architecture Behavioral of AlignModule is
  signal exp_diff : unsigned(3 downto 0);
begin
  exp_diff <= unsigned(expb) - unsigned(exps);
  with exp_diff select
    fraca <= fracs                        when "0000",
             '0' & fracs(7 downto 1)      when "0001",
             "00" & fracs(7 downto 2)     when "0010",
             "000" & fracs(7 downto 3)    when "0011",
             "0000" & fracs(7 downto 4)   when "0100",
             "00000" & fracs(7 downto 5)  when "0101",
             "000000" & fracs(7 downto 6) when "0110",
             "0000000" & fracs(7)         when "0111",
             "00000000"                   when others;
end Behavioral;

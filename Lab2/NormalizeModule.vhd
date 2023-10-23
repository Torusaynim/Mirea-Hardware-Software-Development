library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NormalizeModule is
  Port (
    sum : in std_logic_vector(8 downto 0);
    expb : in std_logic_vector(3 downto 0);
    expn : out std_logic_vector(3 downto 0);
    fracn : out std_logic_vector(7 downto 0)
  );
end NormalizeModule;

architecture Behavioral of NormalizeModule is
  signal lead0 : unsigned(2 downto 0);
  signal sum_norm : std_logic_vector(7 downto 0);
begin
  -- Determine leading zero count
  lead0 <= "000" when (sum(7) = '1') else
           "001" when (sum(6) = '1') else
           "010" when (sum(5) = '1') else
           "011" when (sum(4) = '1') else
           "100" when (sum(3) = '1') else
           "101" when (sum(2) = '1') else
           "110" when (sum(1) = '1') else
           "111";

  -- Shift based on leading zero count
  with lead0 select
    sum_norm <= std_logic_vector(sum(7 downto 0))             when "000",
                std_logic_vector(sum(6 downto 0)) & "0"       when "001",
                std_logic_vector(sum(5 downto 0)) & "00"      when "010",
                std_logic_vector(sum(4 downto 0)) & "000"     when "011",
                std_logic_vector(sum(3 downto 0)) & "0000"    when "100",
                std_logic_vector(sum(2 downto 0)) & "00000"   when "101",
                std_logic_vector(sum(1 downto 0)) & "000000"  when "110",
                std_logic_vector(sum(0 downto 0)) & "0000000" when others;

  process (sum, sum_norm, expb, lead0)
  begin
    if (sum(8) = '1') then
      expn <= std_logic_vector(unsigned(expb) + 1);
      fracn <= sum(8 downto 1);
    elsif (lead0 > unsigned(expb)) then
      expn <= (others => '0');
      fracn <= (others => '0');
    else
      expn <= std_logic_vector(unsigned(expb) - lead0);
      fracn <= std_logic_vector(sum_norm(7 downto 0));
    end if;
  end process;
end Behavioral;

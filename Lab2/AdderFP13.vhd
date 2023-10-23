library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AdderFP13 is
  Port (
    sign1, sign2 : in std_logic;
    exp1, exp2 : in std_logic_vector(3 downto 0);
    frac1, frac2 : in std_logic_vector(7 downto 0);
    sign_out : out std_logic;
    exp_out : out std_logic_vector(3 downto 0);
    frac_out : out std_logic_vector(7 downto 0)
  );
end AdderFP13;

architecture Behavioral of AdderFP13 is
  signal signb, signs : std_logic;
  signal expb, exps : std_logic_vector(3 downto 0);
  signal fracb, fracs, fraca, fracn : std_logic_vector(7 downto 0);
  signal sum : std_logic_vector(8 downto 0);
  
  -- Instantiate SortModule
  component SortModule is
    Port (
      sign1, sign2 : in std_logic;
      exp1, exp2 : in std_logic_vector(3 downto 0);
      frac1, frac2 : in std_logic_vector(7 downto 0);
      signb, signs : out std_logic;
      expb, exps : out std_logic_vector(3 downto 0);
      fracb, fracs : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Instantiate AlignModule
  component AlignModule is
    Port (
      expb, exps : in std_logic_vector(3 downto 0);
      fracs : in std_logic_vector(7 downto 0);
      fraca : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Instantiate AddModule
  component AddModule is
    Port (
      signb, signs : in std_logic;
      fracb, fraca : in std_logic_vector(7 downto 0);
      sum : out std_logic_vector(8 downto 0)
    );
  end component;

  -- Instantiate NormalizeModule
  component NormalizeModule is
    Port (
      sum : in std_logic_vector(8 downto 0);
      expb : in std_logic_vector(3 downto 0);
      expn : out std_logic_vector(3 downto 0);
      fracn : out std_logic_vector(7 downto 0)
    );
  end component;

begin
  SortMod: SortModule
  port map (
    exp1 => exp1,
    exp2 => exp2,
    frac1 => frac1,
    frac2 => frac2,
    sign1 => sign1,
    sign2 => sign2,
    signb => signb,
    signs => signs,
    expb => expb,
    exps => exps,
    fracb => fracb,
    fracs => fracs
  );

  AlignMod: AlignModule
  port map (
    expb => expb,
    exps => exps,
    fracs => fracs,
    fraca => fraca
  );

  AddMod: AddModule
  port map (
    signb => signb,
    signs => signs,
    fracb => fracb,
    fraca => fraca,
    sum => sum
  );

  NormMod: NormalizeModule
  port map (
    sum => sum,
    expb => expb,
    expn => exp_out,
    fracn => frac_out
  );

  sign_out <= signb;
end Behavioral;

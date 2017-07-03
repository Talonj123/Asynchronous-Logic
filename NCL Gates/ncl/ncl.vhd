library ieee;
use ieee.std_logic_1164.all;

package ncl is
  type ncl_pair is record
    data0 : std_logic;
    data1 : std_logic;
  end record ncl_pair;
  
  type ncl_pair_vector is array (integer range <>) of ncl_pair;
  
  component TNM is
    generic(N : integer := 1;
            M : integer := 1;
            Delay : time := 1 ns);
    port(inputs : in  std_logic_vector(0 to N-1);
         output : out std_logic);
  end component TNM;

  component RegisterN is
    generic(N : integer := 1;
            RegisterDelay : time := 40 ns);
    port(inputs    : in ncl_pair_vector(0 to N-1);
         from_next : in std_logic;
         output    : out ncl_pair_vector(0 to N-1);
         to_prev   : out std_logic);
  end component;
  
  component FullAdder is    
    port(cin  : in ncl_pair;
         a    : in ncl_pair;
         b    : in ncl_pair;
         sum  : out ncl_pair;
         cout : out ncl_pair);
  end component;
end ncl;

package body ncl is
  
end package body ncl;
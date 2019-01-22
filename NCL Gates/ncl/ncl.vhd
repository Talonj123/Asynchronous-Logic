library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";

package ncl is
  type ncl_pair is record
    data0 : std_logic;
    data1 : std_logic;
  end record ncl_pair;
  
  type ncl_pair_vector is array (integer range <>) of ncl_pair;

  constant NCL_PAIR_NULL : ncl_pair;
  constant NCL_PAIR_DATA0 : ncl_pair;
  constant NCL_PAIR_DATA1 : ncl_pair;

  function clog2(input : integer) return integer;
  function to_ncl_pair(data0 : std_logic; data1 : std_logic) return ncl_pair;
  function to_ncl_pair_vector(data0 : std_logic_vector; data1 : std_logic_vector) return ncl_pair_vector;
  function to_data0_vector(vec : ncl_pair_vector) return std_logic_vector;
  function to_data1_vector(vec : ncl_pair_vector) return std_logic_vector;

  function TH12_f(prev : std_logic; a : std_logic; b : std_logic) return std_logic;
  function TH22_f(prev : std_logic; a : std_logic; b : std_logic) return std_logic;
  function TH13_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic;
  function TH23_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic;
  function TH33_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic;
  function TH23w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic;
  function TH33w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic;
  function TH14_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH24_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH34_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH44_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH24w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH34w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH44w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH34w3_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH44w3_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH24w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH34w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH44w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH54w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH34w32_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH54w32_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH44w322_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH54w322_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function THxor0_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function THand0_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;
  function TH24comp_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic;

  function "not"(val : ncl_pair) return ncl_pair;
  function ncl_and(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair;
  function ncl_or(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair;
  function ncl_xor(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair;

  function add(prev : ncl_pair_vector; left : ncl_pair_vector; right : ncl_pair_vector; ci : ncl_pair) return ncl_pair_vector;
  function add(prev : ncl_pair_vector; a : ncl_pair; b : ncl_pair; ci : ncl_pair) return ncl_pair_vector;
  
  component TH12 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH22 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH13 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH23 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH33 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH14 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH24 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH34 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH44 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH23w2 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH33w2 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH24w2 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH34w2 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH44w2 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH34w3 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH44w3 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH24w22 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH34w22 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH44w22 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH54w22 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH34w32 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH54w32 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH44w322 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH54w322 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component THxor0 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component THand0 is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  component TH24comp is
  port(iA : in  std_logic;
       iB : in  std_logic;
       iC : in  std_logic;
       iD : in  std_logic;
       osig : out std_logic := '0');
  end component;

  -- an OR gate
  component TH1n is
    generic(N : integer := 2);
    port(isig : in  std_logic_vector(0 to N-1);
         osig : out std_logic := '0');
  end component;

  -- a NCL AND gate
  component THnn is
    generic(N : integer := 2);
    port(isig : in  std_logic_vector(0 to N-1);
         osig : out std_logic := '0');
  end component;

end ncl;

package body ncl is
  constant NCL_PAIR_NULL : ncl_pair := ('0', '0');
  constant NCL_PAIR_DATA0 : ncl_pair := ('1', '0');
  constant NCL_PAIR_DATA1 : ncl_pair := ('0', '1');

  function clog2(input : integer) return integer is
  begin
    return integer(ceil(log2(real(input))));
  end function;

  function to_ncl_pair(data0 : std_logic; data1 : std_logic) return ncl_pair is
  begin
    return (data0, data1);
  end function;

  function to_ncl_pair_vector(data0 : std_logic_vector; data1 : std_logic_vector) return ncl_pair_vector is
    variable toReturn : ncl_pair_vector(0 to data0'length-1);
  begin
    for i in 0 to data0'length-1 loop
	toReturn(i) := (data0(data0'low+i), data1(data1'low+i));
    end loop;
    return toReturn;
  end function;

  function to_data0_vector(vec : ncl_pair_vector) return std_logic_vector is
    variable toReturn : std_logic_vector(0 to vec'length-1);
  begin
    for i in 0 to vec'length-1 loop
      toReturn(i) := vec(vec'low+i).data0;
    end loop;
    return toReturn;
  end function;

  function to_data1_vector(vec : ncl_pair_vector) return std_logic_vector is
    variable toReturn : std_logic_vector(0 to vec'length-1);
  begin
    for i in 0 to vec'length-1 loop
      toReturn(i) := vec(vec'low+i).data1;
    end loop;
    return toReturn;
  end function;

  function "not"(val : ncl_pair) return ncl_pair is
  begin
    return (val.DATA1, val.DATA0);
  end function;

  function ncl_and(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair is
  begin
    if (left = NCL_PAIR_NULL AND right = NCL_PAIR_NULL) then return NCL_PAIR_NULL;
    elsif (left = NCL_PAIR_NULL OR right = NCL_PAIR_NULL) then return prev;
    elsif (left = NCL_PAIR_DATA1 AND right = NCL_PAIR_DATA1) then return NCL_PAIR_DATA1;
    else return NCL_PAIR_DATA0;
    end if;
  end function;

  function ncl_or(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair is
  begin
    if (left = NCL_PAIR_NULL AND right = NCL_PAIR_NULL) then return NCL_PAIR_NULL;
    elsif (left = NCL_PAIR_NULL OR right = NCL_PAIR_NULL) then return prev;
    elsif (left = NCL_PAIR_DATA1 OR right = NCL_PAIR_DATA1) then return NCL_PAIR_DATA1;
    else return NCL_PAIR_DATA0;
    end if;
  end function;

  function ncl_xor(prev : ncl_pair; left : ncl_pair; right : ncl_pair) return ncl_pair is
  begin
    if (left = NCL_PAIR_NULL AND right = NCL_PAIR_NULL) then return NCL_PAIR_NULL;
    elsif (left = NCL_PAIR_NULL OR right = NCL_PAIR_NULL) then return prev;
    elsif (left /= right) then return NCL_PAIR_DATA1;
    else return NCL_PAIR_DATA0;
    end if;
  end function;

  function TH12_f(prev : std_logic; a : std_logic; b : std_logic) return std_logic is
  begin
    if (a OR b) = '0' then return '0';
    elsif (a OR b) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH22_f(prev : std_logic; a : std_logic; b : std_logic) return std_logic is
  begin
    if (a OR b) = '0' then return '0';
    elsif (a AND b) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH13_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic is
  begin
    if (a OR b) = '0' then return '0';
    elsif (a OR b OR c) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH23_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic is
  begin
    if (a OR b OR c) = '0' then return '0';
    elsif ((a AND b) OR (b AND c) OR (c AND a)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH33_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic is
  begin
    if (a OR b OR c) = '0' then return '0';
    elsif (a AND b AND c) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH23w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic is
  begin
    if (a OR b OR c) = '0' then return '0';
    elsif (a OR (b AND c)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH33w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic) return std_logic is
  begin
    if (a OR b OR c) = '0' then return '0';
    elsif ((a AND b) OR (a AND c)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH14_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a OR b OR c OR d) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH24_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (a AND d) OR (b AND c) OR (b AND d) OR (c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH34_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b AND c) OR (a AND b AND d) OR (a AND c AND d) OR (b AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH44_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a AND b AND c AND d) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH24w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a OR (b AND c) OR (b AND d) OR (c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH34w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (a AND d) OR (b AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH44w2_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b AND c) OR (a AND b AND d) OR (a AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH34w3_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a OR (b AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH44w3_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (a AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH24w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a OR b OR (c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH34w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (a AND d) OR (b AND c) OR (b AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH44w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c AND d) OR (b AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH54w22_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b AND c) OR (a AND b AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH34w32_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif (a OR (b AND c) OR (b AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH54w32_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH44w322_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (a AND d) OR (b AND c)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function TH54w322_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (a AND c) OR (b AND c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function THxor0_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b) OR (c AND d)) = '1' then return '1';
    else return prev;
    end if;
  end function;

  function THand0_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND b)OR (b AND c) OR (a AND d)) = '1' then return '1';
    else return prev; 
    end if;
  end function;

  function TH24comp_f(prev : std_logic; a : std_logic; b : std_logic; c : std_logic; d : std_logic) return std_logic is
  begin
    if (a OR b OR c OR d) = '0' then return '0';
    elsif ((a AND c) OR (b AND c) OR (a AND d) OR (b AND d)) = '1' then return '1';
    else return prev; 
    end if;
  end function;

  function add(prev : ncl_pair_vector; a : ncl_pair; b : ncl_pair; ci : ncl_pair) return ncl_pair_vector is
    variable sum : ncl_pair;
    variable carry : ncl_pair;
  begin
    if (a = NCL_PAIR_NULL AND b = NCL_PAIR_NULL AND ci = NCL_PAIR_NULL) then
      sum := NCL_PAIR_NULL;
      carry := NCL_PAIR_NULL;
    elsif (a = NCL_PAIR_NULL OR b = NCL_PAIR_NULL OR ci = NCL_PAIR_NULL) then
      sum := prev(0);
      carry := prev(1);
    elsif (a = NCL_PAIR_DATA0 AND b = NCL_PAIR_DATA0 AND ci = NCL_PAIR_DATA0) then
      sum := NCL_PAIR_DATA0;
      carry := NCL_PAIR_DATA0;
    elsif (a = NCL_PAIR_DATA1 AND b = NCL_PAIR_DATA1 AND ci = NCL_PAIR_DATA0) then
      sum := NCL_PAIR_DATA0;
      carry := NCL_PAIR_DATA1;
    elsif (a /= b AND ci = NCL_PAIR_DATA0) then
      sum := NCL_PAIR_DATA1;
      carry := NCL_PAIR_DATA0;
    elsif (a = NCL_PAIR_DATA0 AND b = NCL_PAIR_DATA0 AND ci = NCL_PAIR_DATA1) then
      sum := NCL_PAIR_DATA1;
      carry := NCL_PAIR_DATA0;
    elsif (a = NCL_PAIR_DATA1 AND b = NCL_PAIR_DATA1 AND ci = NCL_PAIR_DATA1) then
      sum := NCL_PAIR_DATA1;
      carry := NCL_PAIR_DATA1;
    elsif (a /= b AND ci = NCL_PAIR_DATA1) then
      sum := NCL_PAIR_DATA0;
      carry := NCL_PAIR_DATA1;
    end if;
    return (sum & carry);
  end function;

  -- sum is the first N entries of the return.
  function add(prev : ncl_pair_vector; left : ncl_pair_vector; right : ncl_pair_vector; ci : ncl_pair) return ncl_pair_vector is
    -- Even indexes are the sums, odd are the carries.
    variable values : ncl_pair_vector(0 to 2*left'length - 1);
    variable toReturn : ncl_pair_vector(0 to 2*left'length - 1);
  begin
    -- translation from (sum,carries) to bit-by bit (sum0,carry0,sum1,carry1,...,sumN,carryN)
    for i in 1 to left'length - 1 loop
      values(2*i to 2*i+1) := (prev(i) & prev(i+left'length));
    end loop;

    -- Do the addition
    values(0 to 1) := add(values(0 to 1), left(0), right(0), ci);
    for i in 1 to left'length - 1 loop
      values(2*i to 2*i+1) := add(values(2*i to 2*i+1), left(i), right(i), values(2*i-1));
    end loop;

    -- translation from bit-by bit (sum0,carry0,sum1,carry1,...,sumN,carryN) to (sum,carries)
    for i in 1 to left'length - 1 loop
      toReturn(i) := values(2*i);
      toReturn(i+left'length) := values(2*i+1);
    end loop;
    return toReturn;
  end function;

end package body ncl;

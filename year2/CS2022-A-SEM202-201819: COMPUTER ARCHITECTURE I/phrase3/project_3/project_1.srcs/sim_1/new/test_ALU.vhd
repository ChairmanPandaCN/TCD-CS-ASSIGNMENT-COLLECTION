library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_ALU is
--  Port ( );
end test_ALU;

architecture Behavioral of test_ALU is
 COMPONENT ALU IS 
 PORT(
 		A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		Cin: IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		G :  OUT std_logic_vector(15 DOWNTO 0);
		Cout : OUT std_logic;
		overflow : OUT std_logic
);
END COMPONENT;

SIGNAL A : STD_LOGIC_VECTOR (15 DOWNTO 0) := (others=>'0');
SIGNAL B : STD_LOGIC_VECTOR (15 DOWNTO 0) := (others=>'0');
SIGNAL Cin : STD_LOGIC := '0';
SIGNAL S0 : STD_LOGIC :='0';
SIGNAL S1 : STD_LOGIC :='0';
SIGNAL S2 : STD_LOGIC :='0';
SIGNAL G : STD_LOGIC_VECTOR (15 DOWNTO 0) := (others=>'0');
SIGNAL Cout : STD_LOGIC :='0';
SIGNAL overflow : std_logic :='0';

begin
--Intantiate the Unit Under Test
uut: ALU port map(
    A => A,
    B => B,
    Cin =>Cin,   
    S0=>S0,
    S1=>S1,
    S2=>S2,
    G=>G,
    Cout=>Cout,
    overflow=>overflow
);
stim_proc: process
    begin
    A <="0000000000000001";
    B <="0000000000000000";
    --test and gate
    S0 <='0';
    S1 <='0';
    S2 <='1';
    wait for 10 ns;
  
      --test xor gate
    S0 <='0';
    S1 <='1';
    S2 <='1';
    wait for 10 ns;
    
        --test transfer A
    S0<='0';
    S1<='0';
    S2<='0';
    Cin<='0';
    A<="0000000000001011";
    B<="0000000000000001";
    wait for 10 ns;
    --test 1355+1173+0 in decimal
    --test 0000010101001011+0000010010010101+0 in binary 
    --test D54B+495+0=9E0 in hex
    --cout=0;
    A<="0000010101001011";
    B<="0000010010010101";
    Cin<='0';
    S0<='1';
    S1<='0';
    S2<='0';
    wait for 10 ns;    
     --test 32767-2000+1 in decimal
    --test 0111111111111111-+1 in binary 
    --test 7fff-7D0+1=782F in hex
    --cout=0;
    A<="0111111111111111";
    B<="0000011111010000";
    Cin<='1';
    S0<='0';
    S1<='1';
    S2<='0';
    wait for 5 ns;
    
     --test 32767+0+1 in decimal
    --test 0111111111111111+0+0 in binary 
    --test ffff+0+0=0 in hex
    --cout=0;
    --overflow=1;
    A<="0111111111111111";
    B<="0000000000000001";
    Cin<='0';
    S0<='1';
    S1<='0';
    S2<='0';
    wait ;      
    end process;
end Behavioral;

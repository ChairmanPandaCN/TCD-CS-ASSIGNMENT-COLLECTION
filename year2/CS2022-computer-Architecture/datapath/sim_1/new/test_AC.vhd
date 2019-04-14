

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity test_AC is
--  Port ( );
end test_AC;

architecture Behavioral of test_AC is
 component AC is
 port(
 		A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		carryIn : IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		G : INOUT std_logic_vector(15 DOWNTO 0);
		carryOut : OUT std_logic;
		overflow : OUT std_logic
 );
 end component;
 
 --inputs;
signal A : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
signal B : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
signal carryIn : STD_LOGIC := '0';
signal S0 : STD_LOGIC := '0';
signal s1 : STD_LOGIC := '0';
--output;
signal carryOut : STD_LOGIC := '0';
signal overflow : STD_LOGIC := '0';
signal G : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');


begin
--Intantiate the Unit Under Test
uut: AC port map(
    A => A,
    B => B,
    carryIn => carryIn,
    S0=>S0,
    S1=>S1,
    G=>G,
    carryOut=>carryOut,
    overflow=>overflow
);
stim_proc: process
    begin
    --test transfer A
    S0<='1';
    S1<='1';
    A<="0000000000001010";
    carryIn<='1';
    wait for 5 ns ;
    --test transfer A
    S0<='0';
    S1<='0';
    carryIn<='0';
    A<="0000000000001011";
    B<="0000000000000001";
    wait for 5 ns;
    --test transfer A
    S0<='0';
    S1<='0';
    A<="0000000000001010";
    carryIn<='0';
    wait for 5 ns;  
        
    --test 10+11+1=22 in decimal
    --test 1010+1011+1=10110 in binary
    --test a+b+1=16 in hex
    --cout=0
    A<="0000000000001010";
    B<="0000000000001011";
    carryIn<='1';
    S0<='1';
    S1<='0';
    wait for 5 ns;
    --test 32767+0+1 in decimal
    --test 0111111111111111+0+0 in binary 
    --test ffff+0+0=0 in hex
    --cout=0;
    A<="0111111111111111";
    B<="0000000000000001";
    carryIn<='0';
    S0<='1';
    S1<='0';
    wait for 5 ns;
     --test 1355+1173+0 in decimal
    --test 0000010101001011+0000010010010101+0 in binary 
    --test D54B+495+0=9E0 in hex
    --cout=0;
    A<="0000010101001011";
    B<="0000010010010101";
    carryIn<='0';
    S0<='1';
    S1<='0';
    wait for 5ns ;    
    
    --test 32767-2000+1 in decimal
    --test 0111111111111111-+1 in binary 
    --test 7fff-7D0+1=782F in hex
    --cout=0;
    A<="0111111111111111";
    B<="0000011111010000";
    carryIn<='1';
    S0<='0';
    S1<='1';
    wait for 5 ns;      
   
    --test transfer A
    S0<='1';
    S1<='1';
    A<="0000000000001010";
    carryIn<='1';
    wait;

       
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_RCA is
--  Port ( );
end test_RCA;

architecture Behavioral of test_RCA is

component ripple_carry_adder
 port(
        X : IN std_logic_vector(15 DOWNTO 0);
		Y : IN std_logic_vector(15 DOWNTO 0);
		Cin : IN std_logic;
		Cout : OUT std_logic;
		S : OUT std_logic_vector(15 DOWNTO 0)
		);
end component;

--inputs;
signal X : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
signal Y : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');
signal Cin : STD_LOGIC := '0';
--output;

signal Cout : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');

begin


--Intantiate the Unit Under Test
uut: ripple_carry_adder port map(
    X => X,
    Y => Y,
    Cin => Cin,
    Cout=>Cout,
    S=>S
);
stim_proc: process
    begin
    --test 10+11+1=22 in decimal
    --test 1010+1011+1=10110 in binary
    --test a+b+1=16 in hex
    --cout=0
    X<="0000000000001010";
    Y<="0000000000001011";
    Cin<='1';
    wait for 5 ns;
    --test 65535+0+1 in decimal
    --test 1111111111111111+0+1 in binary 
    --test ffff+0+1=0 in hex
    --cout=1;
    X<="0111111111111111";
    Y<="0000000000000000";
    Cin<='1';
    wait for 5 ns;
     --test 1355+1173+0 in decimal
    --test 0000010101001011+0000010010010101+0 in binary 
    --test D54B+495+0=9E0 in hex
    --cout=0;
    X<="0000010101001011";
    Y<="0000010010010101";
    Cin<='0';
    wait  ;          
    end process;
end Behavioral;		
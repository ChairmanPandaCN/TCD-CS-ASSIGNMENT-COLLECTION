--ArithmeticCircuit
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY AC IS
	PORT (
		A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		carryIn : IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		G : OUT std_logic_vector(15 DOWNTO 0);
		carryOut : OUT std_logic;
		overflow : OUT std_logic
	);
END AC;

ARCHITECTURE Behavioral OF AC IS
	COMPONENT ripple_carry_adder
		PORT (
			X : IN std_logic_vector(15 DOWNTO 0);
			Y : IN std_logic_vector(15 DOWNTO 0);
			Cin : IN std_logic;
			Cout : OUT std_logic;
			S : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
    
    COMPONENT MUX4_16bit 
        port (
    In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	In2 : IN std_logic_vector(15 DOWNTO 0);
	In3 : IN std_logic_vector(15 DOWNTO 0);
	S0 : IN std_logic;
	S1 : IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
	);
	end component;
	
	COMPONENT overflow_detector
	port(
	 carryIn : In std_logic;
     S0 : IN STD_LOGIC;
      S1 : IN STD_LOGIC;
 A :  IN std_logic_vector(15 DOWNTO 0);
 B :  IN std_logic_vector(15 DOWNTO 0);
 G :  IN std_logic_vector(15 DOWNTO 0);
 O :  OUT std_logic
	);
	end component;
	SIGNAL Y : STD_LOGIC_VECTOR (15 DOWNTO 0):= (others=>'0');
    SIGNAL T0 : STD_LOGIC_VECTOR (15 DOWNTO 0):="0000000000000000";
    SIGNAL T1 : STD_LOGIC_VECTOR (15 DOWNTO 0):= B;
    SIGNAL T2 : STD_LOGIC_VECTOR (15 DOWNTO 0):= NOT B;
    SIGNAL T3 : STD_LOGIC_VECTOR (15 DOWNTO 0):="1111111111111111";
    SIGNAL detector : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
     T0  <="0000000000000000";
     T1  <= B;
     T2  <= NOT B;
     T3  <="1111111111111111";
    MUX4 :MUX4_16bit
    PORT MAP(
    In0 => T0,
    In1 => T1,
    In2 => T2,
    In3 => T3,
    S0 =>S0,
    S1 =>S1,
    Z =>Y
    );
 
	Ripple_carry_adder00 : ripple_carry_adder
	PORT MAP(
		X => A, 
		Y => Y, 
		Cin => carryIn, 
		Cout => carryOut, 
		S => detector
	);
    OD :overflow_detector
    PORT MAP(
     carryIn=>carryIn,
     S0=>S0,
     S1=>S1,
     A=>A,
     B=>B,
     G=>detector,
     O=>overflow
    );	
    G<=detector;	   		   
END Behavioral;
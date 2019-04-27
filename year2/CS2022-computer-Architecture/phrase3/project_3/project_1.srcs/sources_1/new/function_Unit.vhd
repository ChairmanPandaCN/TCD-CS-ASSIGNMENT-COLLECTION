LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY function_Unit IS
	PORT (
		FS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		V : OUT STD_LOGIC;
		C : OUT STD_LOGIC;
		N : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
		F : OUT std_logic_vector(15 DOWNTO 0)
	);
END function_Unit;

ARCHITECTURE Behavioral OF function_Unit IS
	COMPONENT ALU
		PORT (
			A : IN std_logic_vector(15 DOWNTO 0);
			B : IN std_logic_vector(15 DOWNTO 0);
			Cin : IN std_logic;
			S0 : IN std_logic;
			S1 : IN std_logic;
			S2 : IN std_logic;
			G : OUT std_logic_vector(15 DOWNTO 0);
			Cout : OUT std_logic;
			overflow : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Shifter
		PORT (
			B : IN std_logic_vector(15 DOWNTO 0);
			H : OUT std_logic_vector(15 DOWNTO 0);
			S0, S1 : IN std_logic;
			left, right : IN std_logic := '0'
		);
	END COMPONENT;
 
	COMPONENT MUX2_16bit
		PORT (
			In0 : IN std_logic_vector(15 DOWNTO 0);
			In1 : IN std_logic_vector(15 DOWNTO 0);
			S0 : IN std_logic;
			Z : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT; 
 
	COMPONENT zero_detector
		PORT (
			G : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Z : OUT STD_LOGIC
		);
	END COMPONENT;
 
	COMPONENT negative_detector
		PORT (
			G : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			N : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL ALUout, ShifterOut : std_logic_vector(15 DOWNTO 0);
BEGIN
	ALU00 : ALU
	PORT MAP(
		A => A, 
		B => B, 
		Cin => FS(0), 
		S0 => FS(1), 
		S1 => FS(2), 
		S2 => FS(3), 
		G => ALUout, 
		Cout => C, 
		overflow => V
	);
 
	ND : negative_detector
	PORT MAP(
		G => ALUout, 
		N => N
	);
 
	ZD : zero_detector
	PORT MAP(
		G => ALUout,
		Z => Z
	);
 
	Shifter00 : Shifter
	PORT MAP(
		B => B, 
		S0 => FS(2), 
		S1 => FS(3), 
		H => ShifterOut
	);
 
	MUX00 : MUX2_16bit
	PORT MAP(
		In0 => ALUout, 
		In1 => ShifterOut, 
		S0 => FS(4), 
		Z => F
	);

END Behavioral;
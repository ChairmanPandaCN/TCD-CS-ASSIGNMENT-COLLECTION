LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY controlUnit IS
	PORT (
		dataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0); --FROM MEMORY
		N : IN STD_LOGIC;
		Z : IN STD_LOGIC;
		C : IN STD_LOGIC;
		V : IN STD_LOGIC;
		pc_reset : IN STD_LOGIC;
		car_reset : IN STD_LOGIC;
		clock : IN STD_LOGIC; --FROM OUTSIDE WORLD
		-----FOR CONTROL UNIT
		MB : OUT STD_LOGIC;
		FS : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
		MD : OUT STD_LOGIC;
		RW : OUT STD_LOGIC;
		MM : OUT STD_LOGIC;
		MW : OUT STD_LOGIC;
		--------------
		TDDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		TASA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		TBSB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		SB_Immediate : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		---------PC
		Address : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END controlUnit;

ARCHITECTURE Behavioral OF controlUnit IS
	COMPONENT CAR
		PORT (
			OPCODE : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			notNextInstruction : IN STD_LOGIC;
			clock : IN STD_LOGIC;
			car_reset : IN STD_LOGIC;
			output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT MUXC
		PORT (
			S0 : IN STD_LOGIC;
			NA : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			OPCODE : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			OUTPUT : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT MUXS
		PORT (
			S0 : IN STD_LOGIC;
			S1 : IN STD_LOGIC;
			S2 : IN STD_LOGIC;
			N : IN STD_LOGIC;
			Z : IN STD_LOGIC;
			V : IN STD_LOGIC;
			C : IN STD_LOGIC;
			output : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT instructionRegister
		PORT (
			instruction : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			IL : IN STD_LOGIC;
			clock : IN STD_LOGIC;
			DR : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			SA : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			SB : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			OPCODE : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT controlMemory
		PORT (
			IN_CAR : IN std_logic_vector(7 DOWNTO 0);
			MW : OUT std_logic;
			MM : OUT std_logic;
			RW : OUT std_logic;
			MD : OUT std_logic;
			FS : OUT std_logic_vector(4 DOWNTO 0);
			MB : OUT std_logic;
			TB : OUT std_logic;
			TA : OUT std_logic;
			TD : OUT std_logic;
			PL : OUT std_logic;
			PI : OUT std_logic;
			IL : OUT std_logic;
			MC : OUT std_logic;
			MS : OUT std_logic_vector(2 DOWNTO 0);
			NA : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT programCounter
		PORT (
			extend : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			pi : IN STD_LOGIC;
			pl : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			clock : IN STD_LOGIC;
			address : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;

	--FOR MUXS
	SIGNAL IN_MUXS : STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL notNextInstruction : STD_LOGIC ;
	--FOR MUXC
	SIGNAL OUT_MUXC : STD_LOGIC_VECTOR (7 DOWNTO 0);
	--FOR InstructionRegister
	SIGNAL OUT_IR : STD_LOGIC_VECTOR (7 DOWNTO 0);
	--control memory output can be used inside control unit
	SIGNAL cmMW : std_logic;
	SIGNAL cmMM : std_logic;
	SIGNAL cmRW : std_logic;
	SIGNAL cmMD : std_logic;
	SIGNAL cmFS : std_logic_vector(4 DOWNTO 0);
	SIGNAL cmMB : std_logic;
	SIGNAL cmTB : std_logic;
	SIGNAL cmTA : std_logic;
	SIGNAL cmTD : std_logic;
	SIGNAL cmPL : std_logic;
	SIGNAL cmPI : std_logic;
	SIGNAL cmIL : std_logic;
	SIGNAL cmMC : std_logic;
	SIGNAL cmMS : std_logic_vector(2 DOWNTO 0);
	SIGNAL cmNA : std_logic_vector(7 DOWNTO 0);
	--FOR CAR
	SIGNAL OUT_CAR : STD_LOGIC_VECTOR (7 DOWNTO 0);
	--FOR IR
	SIGNAL DR_IR : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL SA_IR : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL SB_IR : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL extend : STD_LOGIC_VECTOR (5 DOWNTO 0);

BEGIN
	MUXS0 : MUXS
	PORT MAP(
		S0 => cmMS(0), 
		S1 => cmMS(1), 
		S2 => cmMS(2), 
		N => N, 
		Z => Z, 
		V => V, 
		C => C, 
		OUTPUT => notNextInstruction
	);
	instructionRegister00 : InstructionRegister
	PORT MAP(
		instruction => dataIn, 
		IL => cmIL, 
		clock => clock, 
		DR => DR_IR, 
		SA => SA_IR, 
		SB => SB_IR, 
		OPCODE => OUT_IR
	);
	extend <= DR_IR & SB_IR;
	programCounter0 : programCounter
	PORT MAP(
		extend => extend, 
		pi => cmPI, 
		pl => cmPL, 
		reset => pc_reset, 
		clock => clock, 
		address => Address
	);
	MUXC0 : MUXC
	PORT MAP(
		S0 => cmMC, 
		NA => cmNA, 
		OPCODE => OUT_IR, 
		OUTPUT => OUT_MUXC
	);
	CAR0 : CAR
	PORT MAP(
		car_reset => car_reset, 
		OPCODE => OUT_MUXC, 
		notNextInstruction => notNextInstruction, 
		clock => clock, 
		OUTPUT => OUT_CAR
	);
	controlMemory0 : controlMemory
	PORT MAP(
		IN_CAR => OUT_CAR, 
		MW => cmMW, 
		MM => cmMM, 
		RW => cmRW, 
		MD => cmMD, 
		FS => cmFS, 
		MB => cmMB, 
		TB => cmTB, 
		TA => cmTA, 
		TD => cmTD, 
		PL => cmPL, 
		PI => cmPI, 
		IL => cmIL, 
		MC => cmMC, 
		MS => cmMS, 
		NA => cmNA
	);
	---update Control memory output
	MB <= cmMB;
	FS <= cmFS;
	MD <= cmMD;
	RW <= cmRW;
	MM <= cmMM;
	MW <= cmMW;
	TDDR <= cmTD & DR_IR;
	TASA <= cmTA & SA_IR;
	TBSB <= cmTB & SB_IR;
	SB_Immediate <= "0000000000000" & SB_IR;
 
END Behavioral;
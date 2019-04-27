LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_dataPath IS
	--Port ();
END test_dataPath;

ARCHITECTURE Behavioral OF test_dataPath IS
	COMPONENT dataPath
		PORT (
			CW : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
			DataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			ConstantIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			V : OUT STD_LOGIC;
			C : OUT STD_LOGIC;
			N : OUT STD_LOGIC;
			Z : OUT STD_LOGIC;
			AddressOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			dataOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;
	--INPUT
	SIGNAL CW : STD_LOGIC_VECTOR (16 DOWNTO 0);
	SIGNAL DataIn : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL ConstantIn : STD_LOGIC_VECTOR (15 DOWNTO 0);
	--OUTPUT
	SIGNAL V : STD_LOGIC;
	SIGNAL C : STD_LOGIC;
	SIGNAL N : STD_LOGIC;
	SIGNAL Z : STD_LOGIC;
	SIGNAL AddressOut : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL dataOut : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
	uut : dataPath
	PORT MAP(
		CW => CW, 
		DataIn => DataIn, 
		ConstantIn => ConstantIn, 
		V => V, 
		C => C, 
		N => C, 
		Z => Z, 
		AddressOut => AddressOut, 
		dataOut => dataOut
	);
 
	stim_proc : PROCESS
	BEGIN
		--load decimal 2 into register 02;
		CW <= "01000000000000001";
		DataIn <= "0000000000000010";
		ConstantIn <= "0000000000000000";
		WAIT for 20 ns;
        
        CW <="00001000000000000";
        wait;
	END PROCESS;
END Behavioral;
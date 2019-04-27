
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY test_FU IS
	-- Port ();
END test_FU;

ARCHITECTURE Behavioral OF test_FU IS
	COMPONENT function_unit
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
	END COMPONENT;

	SIGNAL FS : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
	SIGNAL A : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL B : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL F : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
	SIGNAL V : STD_LOGIC := '0';
	SIGNAL C : STD_LOGIC := '0';
	SIGNAL N : STD_LOGIC := '0';
	SIGNAL Z : STD_LOGIC := '0';

BEGIN
	uut : function_unit
	PORT MAP(
		FS => FS, 
		A => A, 
		B => B, 
		V => V, 
		C => C, 
		N => N, 
		Z => Z,
		F => F 
	);
	stim_proc : PROCESS
	BEGIN
		A <= "0000000000000001";
		B <= "0000000000000000";
		--test and gate
		FS <= "01000";
		WAIT FOR 10 ns;
 
		--test xor gate
		FS <= "01100";
		WAIT FOR 10 ns;
 
		--test transfer A
		FS <= "00000";
		WAIT FOR 10 ns;
		
		--test ADD
		A <= "1111111111111111";
		B <= "0000000000000001";
		FS <= "00010";
		WAIT FOR 10 ns;
        
        A <= "0111111111111111";
		B <= "0000000000000001";
		FS <= "00010";
		WAIT FOR 10 ns;
		
		A <= "1111111111111111";
		B <= "1111111111111111";
		FS <= "00101";
		WAIT FOR 10 ns;
		
		B <= "0000000000000001";
		FS <= "11000";
		wait;
	END PROCESS;
END Behavioral;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY test_controlMemory IS
	--  Port ( );
END test_controlMemory;

ARCHITECTURE Behavioral OF test_controlMemory IS
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

	SIGNAL IN_CAR : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL MW : STD_LOGIC;
	SIGNAL MM : std_logic;
	SIGNAL RW : std_logic;
	SIGNAL MD : std_logic;
	SIGNAL FS : std_logic_vector(4 DOWNTO 0);
	SIGNAL MB : std_logic;
	SIGNAL TB : std_logic;
	SIGNAL TA : std_logic;
	SIGNAL TD : std_logic;
	SIGNAL PL : std_logic;
	SIGNAL PI : std_logic;
	SIGNAL IL : std_logic;
	SIGNAL MC : std_logic;
	SIGNAL MS : std_logic_vector(2 DOWNTO 0);
	SIGNAL NA : std_logic_vector(7 DOWNTO 0);
BEGIN
	uut : controlMemory PORT MAP(
		IN_CAR => IN_CAR,
		MW => MW,
		MM => MM,
		RW => RW,
		MD => MD,
		FS => FS,
		MB => MB,
		TB => TB,
		TA => TA,
		TD => TD,
		PL => PL,
		PI => PI,
		IL => IL,
		MC => MC,
		MS => MS,
		NA => NA
	);

	stim_proc : PROCESS
	BEGIN
		IN_CAR <= "00000000";
		WAIT FOR 10 ns;
		IN_CAR <= "00000001";
		WAIT FOR 10 ns;
		IN_CAR <= "00000010";
        WAIT FOR 10 ns;
        IN_CAR <= "00000011";
        WAIT FOR 4 ns;
        IN_CAR <= "00000100";
        WAIT FOR 4 ns;
        IN_CAR <= "00000101";
        WAIT FOR 4 ns;
		WAIT;
	END PROCESS;
END Behavioral;
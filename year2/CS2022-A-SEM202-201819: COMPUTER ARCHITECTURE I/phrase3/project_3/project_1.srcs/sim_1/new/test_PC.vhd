LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_PC IS
	--  Port ( );
END test_PC;

ARCHITECTURE Behavioral OF test_PC IS
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
	SIGNAL extend : STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL pi : STD_LOGIC;
	SIGNAL pl : STD_LOGIC;
	SIGNAL reset : STD_LOGIC;
	SIGNAL address : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL clock : STD_LOGIC;
	CONSTANT clk_period : TIME := 4 ns;
BEGIN
	uut : programCounter PORT MAP(
		extend => extend,
		clock => clock,
		pi => pi,
		pl => pl,
		reset => reset,
		address => address
	);
	clk_proc : PROCESS
	BEGIN
		clock <= '0';
		WAIT FOR clk_period/2;
		clock <= '1';
		WAIT FOR clk_period/2;
	END PROCESS;

	stim_proc : PROCESS
	BEGIN
		--PC will auto increase by 1;
		pi <= '1';
		extend <= "000000";
		pl <= '0';
		reset <= '0';
		WAIT FOR 4 ns;
		pi <= '0';
		extend <= "000000";
		pl <= '0';
		reset <= '1';
		WAIT FOR 4 ns;

		pi <= '1';
		extend <= "000000";
		pl <= '0';
		reset <= '0';
		WAIT FOR 4 ns;

		pi <= '0';
		extend <= "000010";
		pl <= '1';
		reset <= '0';
		WAIT FOR 4 ns;
		
		pi <= '0';
        extend <= "100010";
        pl <= '1';
        reset <= '0';
        WAIT FOR 4 ns;
        
        pi <= '0';
        extend <= "000000";
        pl <= '0';
        reset <= '1';
        WAIT FOR 4 ns;
        
		WAIT;
	END PROCESS;

END Behavioral;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY test_CPU IS
	--  Port ( );
END test_CPU;

ARCHITECTURE Behavioral OF test_CPU IS
	COMPONENT CPU
		PORT (
			clock : IN STD_LOGIC;
			pc_reset : IN STD_LOGIC;
			car_reset : IN STD_LOGIC
		);
	END COMPONENT;

	SIGNAL clock : STD_LOGIC;
	SIGNAL pc_reset : STD_LOGIC;
	SIGNAL car_reset : STD_LOGIC;
	CONSTANT clk_period : TIME := 20 ns;

BEGIN
	uut : CPU PORT MAP(
		clock => clock,
		pc_reset => pc_reset,
		car_reset => car_reset
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
		car_reset <= '1';
		WAIT FOR clk_period;
		car_reset <= '0';
		WAIT;
	END PROCESS;
END Behavioral;
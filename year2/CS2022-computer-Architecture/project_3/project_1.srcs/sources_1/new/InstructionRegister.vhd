LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY instructionRegister IS
	PORT (
		instruction : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		IL : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		DR : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		SA : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		SB : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		OPCODE : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END instructionRegister;

ARCHITECTURE Behavioral OF instructionRegister IS
BEGIN
	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF (IL = '1') THEN
				OPCODE <= '0'&instruction(15 DOWNTO 9)AFTER 1 ns;
				DR <= instruction(8 DOWNTO 6) AFTER 1 ns;
				SA <= instruction(5 DOWNTO 3) AFTER 1 ns;
				SB <= instruction(2 DOWNTO 0) AFTER 1 ns;
			END IF;
		END IF;
	END PROCESS;

END Behavioral;
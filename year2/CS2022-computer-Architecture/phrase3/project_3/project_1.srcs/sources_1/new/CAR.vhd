LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY CAR IS
	PORT (
		OPCODE : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		notNextInstruction : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		car_reset : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END CAR;

ARCHITECTURE Behavioral OF CAR IS

BEGIN
	PROCESS (clock)
		VARIABLE currentCAR : std_logic_vector(7 DOWNTO 0) := X"00";
	BEGIN
		IF (car_reset = '1') THEN
			currentCAR := "11000000";
		ELSIF (rising_edge(clock)) THEN
			IF notNextInstruction = '1' THEN
				currentCAR := OPCODE;
			ELSIF notNextInstruction = '0' THEN
				currentCAR := currentCAR + conv_integer(1);
			END IF;
		END IF;
		output <= currentCAR;
	END PROCESS;
END Behavioral;
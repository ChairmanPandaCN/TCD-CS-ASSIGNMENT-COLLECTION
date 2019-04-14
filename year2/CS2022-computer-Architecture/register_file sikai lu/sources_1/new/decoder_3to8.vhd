---DECODER 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY decoder_3to8 IS
	PORT (
		A0 : IN std_logic;
		A1 : IN std_logic;
		A2 : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic
	);
END decoder_3to8;

ARCHITECTURE Behavioral OF decoder_3to8 IS
BEGIN
	Q0 <= ((NOT A0) AND (NOT A1) AND (NOT A2)) AFTER 5 ns;
	Q1 <= ((NOT A0) AND (NOT A1) AND (A2)) AFTER 5 ns;
	Q2 <= ((NOT A0) AND (A1) AND (NOT A2)) AFTER 5 ns;
	Q3 <= ((NOT A0) AND (A1) AND (A2)) AFTER 5 ns;
	Q4 <= (A0 AND (NOT A1) AND (NOT A2)) AFTER 5 ns;
	Q5 <= ((A0) AND (NOT A1) AND (A2)) AFTER 5 ns;
	Q6 <= ((A0) AND (A1) AND (NOT A2)) AFTER 5 ns;
	Q7 <= ((A0) AND (A1) AND (A2)) AFTER 5 ns;
END Behavioral;
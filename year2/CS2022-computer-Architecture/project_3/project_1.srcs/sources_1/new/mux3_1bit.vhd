--MULTIFLEXER 3 && 1bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux3_1bit IS
	PORT (
	In0 : IN std_logic;
	In1 : IN std_logic;
	In2 : IN std_logic;
	S0 : IN std_logic;
	S1 : IN std_logic;

	Z : OUT std_logic
	);
END mux3_1bit;
ARCHITECTURE Behavioral OF mux3_1bit IS
BEGIN
	Z <= In0 AFTER 1 ns WHEN S0 = '0' and S1='0' ELSE
	     In1 AFTER 1 ns WHEN S0 = '1' and S1='0'  ELSE
	     In2 AFTER 1 ns WHEN S0 = '0' and S1='1';
END Behavioral;
--MULTIFLEXER 2registers && 16bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux2_16bit IS
	PORT (
	In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	S0 : IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
	);
END mux2_16bit;
ARCHITECTURE Behavioral OF mux2_16bit IS
BEGIN
	Z <= In0 AFTER 1 ns WHEN S0 = '0'ELSE
	     In1 AFTER 1 ns WHEN S0 = '1';
END Behavioral;
--MULTIFLEXER 4 && 16bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux4_16bit IS
	PORT (
	In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	In2 : IN std_logic_vector(15 DOWNTO 0);
	In3 : IN std_logic_vector(15 DOWNTO 0);
	
	S0 : IN std_logic;
	S1 : IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
	);
END mux4_16bit;
ARCHITECTURE Behavioral OF mux4_16bit IS
BEGIN
	Z <= In0 AFTER 1 ns WHEN S0 = '0' AND S1 = '0' ELSE
	     In1 AFTER 1 ns WHEN S0 = '1' AND S1 ='0' ELSE
	     In2 After 1 ns When S0 ='0' AND S1= '1' ELSE
	     In3 AFTER 1 ns when S0 ='1' AND S1= '1';
END Behavioral;
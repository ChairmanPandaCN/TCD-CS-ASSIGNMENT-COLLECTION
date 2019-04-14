--MULTIFLEXER 8registers && 16bits
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux9_16bit IS 
	PORT (
	In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	In2 : IN std_logic_vector(15 DOWNTO 0);
	In3 : IN std_logic_vector(15 DOWNTO 0);
	In4 : IN std_logic_vector(15 DOWNTO 0);
	In5 : IN std_logic_vector(15 DOWNTO 0);
	In6 : IN std_logic_vector(15 DOWNTO 0);
	In7 : IN std_logic_vector(15 DOWNTO 0);
	In8 : IN std_logic_vector(15 DOWNTO 0);
	S0, S1, S2,S3: IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
	);
END mux9_16bit;
ARCHITECTURE Behavioral OF mux9_16bit IS
BEGIN
	Z <= In0 AFTER 1 ns WHEN S0 = '0' AND S1 = '0' AND S2 = '0' AND S3='0' ELSE
	     In1 AFTER 1 ns WHEN S0 = '1' AND S1 = '0' AND S2 = '0' AND S3='0' ELSE
	     In2 AFTER 1 ns WHEN S0 = '0' AND S1 = '1' AND S2 = '0' AND S3='0' ELSE
	     In3 AFTER 1 ns WHEN S0 = '1' AND S1 = '1' AND S2 = '0' AND S3='0' ELSE
	     In4 AFTER 1 ns WHEN S0 = '0' AND S1 = '0' AND S2 = '1' AND S3='0' ELSE
	     In5 AFTER 1 ns WHEN S0 = '1' AND S1 = '0' AND S2 = '1' AND S3='0' ELSE
	     In6 AFTER 1 ns WHEN S0 = '0' AND S1 = '1' AND S2 = '1' AND S3='0' ELSE
	     In7 AFTER 1 ns WHEN S0 = '1' AND S1 = '1' AND S2 = '1' AND S3='0' ELSE
	     In8 AFTER 1 ns WHEN S0 = '0' AND S1 = '0' AND S2 = '0' AND S3='1' ELSE
	     "0000000000000000" AFTER 1 ns;
END Behavioral;
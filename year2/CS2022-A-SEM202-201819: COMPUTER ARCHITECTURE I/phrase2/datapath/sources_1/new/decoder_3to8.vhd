---DECODER 3to8
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
	Q0 <= '1' after 1 ns WHEN A2='0' AND A1='0' AND A0='0' else
	      '0' after 1 ns;
	Q1 <= '1' after 1 ns when A2='0' AND A1='0' AND A0='1' else
	      '0' after 1 ns;
	Q2 <= '1' after 1 ns when A2='0' AND A1='1' AND A0='0' else
	      '0' after 1 ns;
	Q3 <= '1' after 1 ns when A2='0' AND A1='1' AND A0='1' else
	      '0' after 1 ns;
	Q4 <= '1' after 1 ns when A2='1' AND A1='0' AND A0='0' else
	      '0' after 1 ns;  
	Q5 <= '1' after 1 ns when A2='1' AND A1='0' AND A0='1' else
	      '0' after 1 ns;     
	Q6 <= '1' after 1 ns when A2='1' AND A1='1' AND A0='0' else
	      '0' after 1 ns;     
	Q7 <= '1' after 1 ns when A2='1' AND A1='1' AND A0='1' else
	      '0' after 1 ns;        
END Behavioral;
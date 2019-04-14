
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY overflow_detector IS
	PORT (
		carryIn : IN std_logic;
		S0 : IN STD_LOGIC;
		S1 : IN STD_LOGIC;
		A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		G : IN std_logic_vector(15 DOWNTO 0);
		O : OUT std_logic
	);
END overflow_detector;

ARCHITECTURE Behavioral OF overflow_detector IS
BEGIN
	O <= '1' AFTER 1 ns WHEN S1 = '0' AND S0 = '0' AND carryIn = '1' AND A(15) = B(15) AND A(15) /= G(15) ELSE
	     '1' AFTER 1 ns WHEN S1 = '0' AND S0 = '1' AND carryIn = '0' AND A(15) = B(15) AND A(15) /= G(15) ELSE
	     '1' AFTER 1 ns WHEN S1 = '0' AND S0 = '1' AND carryIn = '1' AND A(15) = B(15) AND A(15) /= G(15) ELSE
	     '1' AFTER 1 ns WHEN S1 = '1' AND S0 = '0' AND carryIn = '0' AND A(15) /= B(15) AND A(15) /= G(15) ELSE
	     '1' AFTER 1 ns WHEN S0 = '1' AND S1 = '0' AND carryIn = '1' AND A(15) /= B(15) AND A(15) /= G(15) ELSE
	     '1' AFTER 1 ns WHEN S0 = '1' AND S1 = '1' AND carryIn = '1' AND A(15) /= B(15) AND A(15) /= G(15) ELSE
	     '0' AFTER 1 ns;

END Behavioral;
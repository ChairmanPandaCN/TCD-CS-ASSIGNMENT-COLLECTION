LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY programCounter IS
	PORT (
		extend : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		pi : IN STD_LOGIC;
		pl : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		address : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END programCounter;

ARCHITECTURE Behavioral OF programCounter IS
	SIGNAL temp : STD_LOGIC_VECTOR (15 DOWNTO 0);
BEGIN
	PROCESS (reset, pl, pi, clock)
		VARIABLE current_PC : STD_LOGIC_VECTOR(15 DOWNTO 0);
		VARIABLE temp_curr_PC : INTEGER;
		VARIABLE temp_inc_PC : STD_LOGIC_VECTOR(15 DOWNTO 0);
		VARIABLE negativeNumber : STD_LOGIC_VECTOR(4 DOWNTO 0);
	BEGIN
		IF (rising_edge(clock)) THEN
			IF (reset = '1') THEN
				current_PC := "0000000000000000";
			ELSIF (pl = '1') THEN
				IF (extend(5) = '0') THEN
					current_PC := current_PC + extend(4 DOWNTO 0);
				ELSIF (extend(5) = '1') THEN
					current_PC := current_PC -(NOT (extend(4 DOWNTO 0)-'1'));
				END IF;
			ELSIF (pi = '1') THEN
				temp_curr_PC := conv_integer(current_PC); -- get current allocation
				temp_curr_PC := temp_curr_PC + conv_integer(1); -- increment
				temp_inc_PC := conv_std_logic_vector(temp_curr_PC, 16); -- cast from int to vector
				current_PC := temp_inc_PC; -- store as current PC
			END IF;
			address <= current_PC AFTER 1ns;
		END IF;
	END PROCESS;

END Behavioral;
--ripple_carry_adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ripple_carry_adder IS
	PORT (
		X : IN std_logic_vector(15 DOWNTO 0);
		Y : IN std_logic_vector(15 DOWNTO 0);
		Cin : IN std_logic;
		Cout : OUT std_logic;
		S : OUT std_logic_vector(15 DOWNTO 0)
	);
END ripple_carry_adder;

ARCHITECTURE Behavioral OF ripple_carry_adder IS
	COMPONENT full_adder
		PORT (
			A : IN std_logic;
			B : IN std_logic;
			Cin : IN std_logic;
			S : OUT std_logic;
			Cout : OUT std_logic
		);
	END COMPONENT;
	SIGNAL full_adder00_cout : std_logic;

	SIGNAL full_adder01_cout : std_logic;

	SIGNAL full_adder02_cout : std_logic;

	SIGNAL full_adder03_cout : std_logic;

	SIGNAL full_adder04_cout : std_logic;

	SIGNAL full_adder05_cout : std_logic;

	SIGNAL full_adder06_cout : std_logic;

	SIGNAL full_adder07_cout : std_logic;

	SIGNAL full_adder08_cout : std_logic;

	SIGNAL full_adder09_cout : std_logic;

 

	SIGNAL full_adder10_cout : std_logic;

	SIGNAL full_adder11_cout : std_logic;

	SIGNAL full_adder12_cout : std_logic;

	SIGNAL full_adder13_cout : std_logic;

	SIGNAL full_adder14_cout : std_logic;

	SIGNAL full_adder15_cout : std_logic;

 
BEGIN
	full_adder00 : full_adder
	PORT MAP(
		A => X(0), 
		B => Y(0), 
		Cin => Cin, 
		Cout => full_adder00_cout, 
		s => S(0)
	);
	full_adder01 : full_adder
	PORT MAP(
		A => X(1), 
		B => Y(1), 
		Cin => full_adder00_cout, 
		Cout => full_adder01_cout, 
		s => S(1)
	);

	full_adder02 : full_adder
	PORT MAP(
		A => X(2), 
		B => Y(2), 
		Cin => full_adder01_cout, 
		Cout => full_adder02_cout, 
		s => S(2)
	);
	full_adder03 : full_adder
	PORT MAP(
		A => X(3),
		B => Y(3),
		Cin => full_adder02_cout, 
		Cout => full_adder03_cout, 
		s => S(3)
	);
	full_adder04 : full_adder
	PORT MAP(
		A => X(4), 
		B => Y(4), 
		Cin => full_adder03_cout, 
		Cout => full_adder04_cout, 
		s => S(4)
	);
	full_adder05 : full_adder
	PORT MAP(
		A => X(5), 
		B => Y(5), 
		Cin => full_adder04_cout, 
		Cout => full_adder05_cout, 
		s => S(5)
	);
	full_adder06 : full_adder
	PORT MAP(
		A => X(6), 
		B => Y(6), 
		Cin => full_adder05_cout, 
		Cout => full_adder06_cout, 
		s => S(6)
	);
	full_adder07 : full_adder
	PORT MAP(
		A => X(7), 
		B => Y(7), 
		Cin => full_adder06_cout, 
		Cout => full_adder07_cout, 
		s => S(7)
	);
	full_adder08 : full_adder
	PORT MAP(
		A => X(8), 
		B => Y(8), 
		Cin => full_adder07_cout, 
		Cout => full_adder08_cout, 
		s => S(8)
	);
	full_adder09 : full_adder
	PORT MAP(
		A => X(9), 
		B => Y(9), 
		Cin => full_adder08_cout, 
		Cout => full_adder09_cout, 
		s => S(9)
	);
	full_adder10 : full_adder
	PORT MAP(
		A => X(10), 
		B => Y(10), 
		Cin => full_adder09_cout, 
		Cout => full_adder10_cout, 
		s => S(10)
	);
	full_adder11 : full_adder
	PORT MAP(
		A => X(11), 
		B => Y(11), 
		Cin => full_adder10_cout, 
		Cout => full_adder11_cout, 
		s => S(11)
	);
	full_adder12 : full_adder
	PORT MAP(
		A => X(12), 
		B => Y(12), 
		Cin => full_adder11_cout, 
		Cout => full_adder12_cout, 
		s => S(12)
	);
	full_adder13 : full_adder
	PORT MAP(
		A => X(13), 
		B => Y(13), 
		Cin => full_adder12_cout, 
		Cout => full_adder13_cout, 
		s => S(13)
	);
	full_adder14 : full_adder
	PORT MAP(
		A => X(14), 
		B => Y(14), 
		Cin => full_adder13_cout, 
		Cout => full_adder14_cout, 
		s => S(14)
	);
	full_adder15 : full_adder
	PORT MAP(
		A => X(15), 
		B => Y(15), 
		Cin => full_adder14_cout, 
		Cout => Cout,
		s => S(15)
	);
 
 
END Behavioral;
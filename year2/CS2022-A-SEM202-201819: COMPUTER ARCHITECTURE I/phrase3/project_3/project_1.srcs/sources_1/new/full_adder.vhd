--full_adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



entity full_adder is
  port(
        A : IN std_logic;
		B : IN std_logic;
		Cin : In std_logic;
		S : OUT std_logic;
		Cout :Out std_logic
  );
end full_adder;

architecture Behavioral of full_adder is
begin
    S <= Cin XOR (A XOR B);
    Cout <= (Cin and (A XOR B)) or (A AND B);
end Behavioral;

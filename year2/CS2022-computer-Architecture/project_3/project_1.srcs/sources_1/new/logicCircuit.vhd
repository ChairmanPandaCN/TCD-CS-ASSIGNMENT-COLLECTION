--logic circuit
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LC is
  Port (
   A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   S0 : IN STD_LOGIC;
   S1 : IN STD_LOGIC;
   G : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
end LC;

architecture Behavioral of LC is
     COMPONENT MUX4_16bit 
        port (
    In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	In2 : IN std_logic_vector(15 DOWNTO 0);
	In3 : IN std_logic_vector(15 DOWNTO 0);
	S0 : IN std_logic;
	S1 : IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
	);
	end component;
	
	   SIGNAL T0,T1,T2,T3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
	   
begin
  T0 <= A AND B;
  T1 <= A OR B;
  T2 <= A XOR B;
  T3 <= NOT A;
  
  MUX4 : MUX4_16bit
  port map(
  In0 =>T0,
  In1 =>T1,
  In2 =>T2,
  In3 =>T3,
  S0 => S0,
  S1 => S1,
  Z => G
  );

end Behavioral;

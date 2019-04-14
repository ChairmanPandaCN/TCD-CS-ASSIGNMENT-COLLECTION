---Arithmetic/Logic Unit 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
	PORT (
		A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		Cin: IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		G :  OUT std_logic_vector(15 DOWNTO 0);
		Cout : OUT std_logic;
		overflow : OUT std_logic
	);
END ALU;

ARCHITECTURE Behavioral OF ALU IS
  COMPONENT AC
  port (
    	A : IN std_logic_vector(15 DOWNTO 0);
		B : IN std_logic_vector(15 DOWNTO 0);
		carryIn : IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		G : OUT std_logic_vector(15 DOWNTO 0);
		carryOut : OUT std_logic;
		overflow : OUT std_logic
  );
  end component;
  
  component LC
  Port (
   A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   S0 : IN STD_LOGIC;
   S1 : IN STD_LOGIC;
   G : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   end component;
   
   component mux2_16bit
   port(
   	In0 : IN std_logic_vector(15 DOWNTO 0);
	In1 : IN std_logic_vector(15 DOWNTO 0);
	S0 : IN std_logic;
	Z : OUT std_logic_vector(15 DOWNTO 0)
   );
   end component;
  
  signal ACout,LCout : std_logic_vector(15 downto 0);
  
BEGIN
  AC00 : AC
  port map(
   A=>A,
   B=>B,
   carryIn=>Cin,
   S0 => S0,
   S1 => S1,
   G => ACout,
   carryOut =>Cout,
   overflow=>overflow
  );
  
  LC00 : LC
  port map(
  A=>A,
  B=>B,
  S0=>S0,
  S1=>S1,
  G=>LCout
  );
  mux2 :mux2_16bit
  port map(
  In0=>ACout,
  In1=>LCout,
  S0=>S2,
  Z=>G
  );
  
END Behavioral;
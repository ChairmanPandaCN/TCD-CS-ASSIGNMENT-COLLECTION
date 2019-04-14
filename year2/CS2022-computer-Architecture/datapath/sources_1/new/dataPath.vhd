LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dataPath IS
	PORT (
	    clk : IN STD_LOGIC;
		CW : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		DataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		ConstantIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		V : OUT STD_LOGIC;
		C : OUT STD_LOGIC;
		N : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
		AddressOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		dataOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END dataPath;

ARCHITECTURE Behavioral OF dataPath IS
    component register_File 
    port(
        A_src_s0 : IN std_logic;
		A_src_s1 : IN std_logic;
		A_src_s2 : IN std_logic;
		B_src_s0 : IN std_logic;
		B_src_s1 : IN std_logic;
		B_src_s2 : IN std_logic;
		load : IN std_logic;
		des_A0 : IN std_logic;
		des_A1 : IN std_logic;
		des_A2 : IN std_logic;
		Clk : IN std_logic;
		Bus_D : IN std_logic_vector(15 DOWNTO 0);
		A_data : out std_logic_vector(15 DOWNTO 0);
		B_data : out std_logic_vector(15 DOWNTO 0)
    );
    end component;
    
    component function_Unit
    PORT (
		FS : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		V : OUT STD_LOGIC;
		C : OUT STD_LOGIC;
		N : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
		F : OUT std_logic_vector(15 DOWNTO 0)
	);
    end component;
    
    component MUX2_16bit
    port(
        In0 : IN std_logic_vector(15 DOWNTO 0);
	    In1 : IN std_logic_vector(15 DOWNTO 0);
	    S0 : IN std_logic;
	    Z : OUT std_logic_vector(15 DOWNTO 0)
    );
    end component; 
    
    
    SIGNAL busA : std_logic_vector(15 downto 0);
    SIGNAL busB : std_logic_vector(15 downto 0);
    SIGNAL dataA :std_logic_vector(15 downto 0);
    SIGNAL dataB :std_logic_vector(15 downto 0);
    SIGNAL busD : std_logic_vector(15 downto 0);
    SIGNAL functionUnitOut : std_logic_vector(15 downto 0);
    
    
   -- SIGNAL RW : STD_LOGIC := CW(0);
    --SIGNAL MD : STD_LOGIC :=CW(1);
    --SIGNAL FS : STD_LOGIC_VECTOR (4 DOWNTO 0) :=CW(6 DOWNTO 2);
    --SIGNAL MB : STD_LOGIC :=CW(7);
    --SIGNAL B_src_S0 : Std_logic := CW(8);
    --SIGNAL B_src_S1 : Std_logic := CW(9);
    --SIGNAL B_src_S2 : Std_logic := CW(10);
    --SIGNAL A_src_S0 : Std_logic := CW(11);
    --SIGNAL A_src_S1 : Std_logic := CW(12);
    --SIGNAL A_src_S2 : Std_logic := CW(13);
    --SIGNAL des_A0 : std_logic := CW(14);
    --SIGNAL des_A1 : std_logic := CW(15);
    ---SIGNAL des_A2 : std_logic := CW(16);
    
BEGIN
    MUXD : MUX2_16bit
    port map(
        In0=>functionUnitOut,
        In1=>DataIn,
        S0=>CW(1),
        Z=>busD
    );
    
    MUXB : MUX2_16bit
    port map(
        In0=>dataB,
        In1=>ConstantIn,
        S0=>CW(7),
        Z=>busB
    );
    
    registerFile00 : register_File
    port map(
        Bus_D =>busD,
        A_src_s0 => CW(11),
		A_src_s1 => CW(12),
		A_src_s2 => CW(13),
		B_src_s0 => CW(8),
		B_src_s1 => CW(9),
		B_src_s2 => CW(10),
		load =>CW(0),
		des_A0 =>CW(14),
		des_A1 =>CW(15),
		des_A2 =>CW(16),
		clk=>clk,
		A_data=>busA,
	    B_data=>dataB
    );
    
    functionUnit00 : function_Unit
    port map(
     FS=>CW(6 DOWNTO 2),
     A=>busA,
     B=>busB, 
     V=>V,
     C=>C,
     N=>N,
     Z=>Z,
     F=>functionUnitOut
    );
    DataOut<=busB;
    AddressOut<=busA;
END Behavioral;
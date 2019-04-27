LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dataPath IS
	PORT (
	    clk : IN STD_LOGIC;
	    RW : IN STD_LOGIC;
	    TDDR : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	    TASA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	    TBSB : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	    MB : IN STD_LOGIC;
	    MM : IN STD_LOGIC;
	    FS : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	    MD : IN STD_LOGIC;
	    PCAddress : IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- FROM PC
		DataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0); --FROM MEMORY
		ConstantIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0); --ZERO FILL
		V : OUT STD_LOGIC;
		C : OUT STD_LOGIC;
		N : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
	--	BusB : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
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
        A_src_s3 : IN STD_LOGIC;
		B_src_s0 : IN std_logic;
		B_src_s1 : IN std_logic;
		B_src_s2 : IN std_logic;
		B_src_s3 : IN STD_LOGIC;
		load : IN std_logic;
		des_A0 : IN std_logic;
		des_A1 : IN std_logic;
		des_A2 : IN std_logic;
		des_A3 : IN STD_LOGIC;
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
    SIGNAL busD : std_logic_vector(15 downto 0);
    SIGNAL dataA :std_logic_vector(15 downto 0);
    SIGNAL outMuxB :std_logic_vector(15 downto 0);
    --SIGNAL outMux
    SIGNAL functionUnitOut : std_logic_vector(15 downto 0);
    
    
BEGIN

    registerFile00 : register_File
    port map(
        Bus_D =>busD,
        A_src_s0 => TASA(0),
		A_src_s1 => TASA(1),
		A_src_s2 => TASA(2),
		A_src_s3 => TASA(3),
		B_src_s0 => TBSB(0),
		B_src_s1 => TBSB(1),
		B_src_s2 => TBSB(2),
		B_src_s3 => TBSB(3),
		load =>RW,
		des_A0 =>TDDR(0),
		des_A1 =>TDDR(1),
		des_A2 =>TDDR(2),
		des_A3 =>TDDR(3),
		clk=>clk,
		A_data=>busA,
	    B_data=>busB
    );
    
    MUXB : MUX2_16bit
    port map(
        In0=>busB,
        In1=>ConstantIn,
        S0=>MB,
        Z=>outMuxB
    );
    
    
    MUXM : MUX2_16bit
    port map(
        In0=>busA,
        In1=>PCAddress,
        S0=>MM,
        Z=>AddressOut
    );
    functionUnit00 : function_Unit
       port map(
        FS=>FS,
        A=>busA,
        B=>outMuxB, 
        V=>V,
        C=>C,
        N=>N,
        Z=>Z,
        F=>functionUnitOut
    );
    MUXD : MUX2_16bit
    port map(
        In0=>functionUnitOut,
        In1=>DataIn,
        S0=>MD,
        Z=>busD
    );
   
    DataOut<=outMuxB;
    --AddressOut<=busA;
END Behavioral;
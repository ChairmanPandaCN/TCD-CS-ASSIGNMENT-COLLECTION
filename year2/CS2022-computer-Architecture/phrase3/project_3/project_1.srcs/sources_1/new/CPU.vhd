LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CPU IS
	PORT (
		clock : IN STD_LOGIC;
		pc_reset : IN STD_LOGIC;
		car_reset : IN STD_LOGIC
	);
END CPU;

ARCHITECTURE Behavioral OF CPU IS
	COMPONENT controlUnit
		PORT (
			dataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0); --FROM MEMORY
			N : IN STD_LOGIC;
			Z : IN STD_LOGIC;
			C : IN STD_LOGIC;
			V : IN STD_LOGIC;
			pc_reset : IN STD_LOGIC;
			car_reset : IN STD_LOGIC;
			clock : IN STD_LOGIC; --FROM OUTSIDE WORLD
			-----FOR CONTROL UNIT
			MB : OUT STD_LOGIC;
			FS : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
			MD : OUT STD_LOGIC;
			RW : OUT STD_LOGIC;
			MM : OUT STD_LOGIC;
			MW : OUT STD_LOGIC;
			--------------
			TDDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			TASA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			TBSB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			SB_Immediate : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			---------PC
			Address : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;
 
	COMPONENT dataPath
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
            --    BusB : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                AddressOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                dataOut : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;
 
	COMPONENT memory
		PORT (
			address : IN std_logic_vector(15 DOWNTO 0);
			write_data : IN std_logic_vector(15 DOWNTO 0);
			MemWrite:IN std_logic;
			read_data : OUT std_logic_vector(15 DOWNTO 0) 
		);
	END COMPONENT;
	 
	 
	 --for control Unit
	  SIGNAL V : STD_LOGIC;
      SIGNAL C : STD_LOGIC;
      SIGNAL N : STD_LOGIC;
      SIGNAL Z : STD_LOGIC;
      SIGNAL dataIn : STD_LOGIC_VECTOR( 15 DOWNTO 0);
   --//   SIGNAL pc_reset : STD_LOGIC;
   --//   SIGNAL car_reset : STD_LOGIC;
      SIGNAL MB : STD_LOGIC;
      SIGNAL FS : STD_LOGIC_VECTOR (4 DOWNTO 0);
      SIGNAL MD : STD_LOGIC;
      SIGNAL RW : STD_LOGIC;
      SIGNAL MM : STD_LOGIC;
      SIGNAL MW : STD_LOGIC;
      SIGNAL TDDR : STD_LOGIC_VECTOR(3 DOWNTO 0);
      SIGNAL TASA : STD_LOGIC_VECTOR(3 DOWNTO 0);
      SIGNAL TBSB : STD_LOGIC_VECTOR(3 DOWNTO 0);
      SIGNAL zeroFill : STD_LOGIC_VECTOR (15 DOWNTO 0);
      SIGNAL Address : STD_LOGIC_VECTOR (15 DOWNTO 0);
      
      --for dataPath
      SIGNAL AddressOut : STD_LOGIC_VECTOR (15 DOWNTO 0);
      SIGNAL dataOut : STD_LOGIC_VECTOR (15 DOWNTO 0);
BEGIN
    controlUnit0 : controlUnit
    port map(
    dataIn => dataIn,
    V => V,
    N => N,
    C => C,
    Z => Z,
    pc_reset=>pc_reset,
    car_reset=>car_reset,
    clock=>clock,
    MB=>MB,
    FS=>FS,
    MD=>MD,
    RW=>RW,
    MM=>MM,
    MW=>MW,
    TDDR=>TDDR,
    TASA=>TASA,
    TBSB=>TBSB,
    SB_Immediate=>zeroFill,
    Address=>Address
    );
    
    datapath0 : dataPath
    port map(
    clk=>clock,
    RW=>RW,
    TDDR=>TDDR,
    TASA=>TASA,
    TBSB=>TBSB,
    MB=>MB,
    MM=>MM,
    FS=>FS,
    MD=>MD,
    PCAddress =>Address,
    DataIn=>DataIn, --FROM MEMORY
    ConstantIn=>zeroFill, --ZERO FILL
    V=>V,
    C=>C,
    N=>N,
    Z=>Z,
    AddressOut=>AddressOut,
    dataOut=>dataOut
    );
    memory0 : memory
    port map(
    address => AddressOut,
    write_data=>dataOut,
    MemWrite=>MW,
    read_data=>dataIn
    );
END Behavioral;
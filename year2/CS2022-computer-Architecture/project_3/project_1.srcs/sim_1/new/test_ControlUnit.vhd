library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_ControlUnit is
--  Port ( );
end test_ControlUnit;

architecture Behavioral of test_ControlUnit is
    COMPONENT controlUnit
    port(
    dataIn : IN STD_LOGIC_VECTOR (15 DOWNTO 0); --FROM MEMORY
    Z,N,C,V : IN STD_LOGIC; --FROM DATAPATH
    clock : IN STD_LOGIC; --FROM OUTSIDE WORD
    pc_reset : IN STD_LOGIC; -- FOR PROGRAM COUNTER 
    car_reset : IN STD_LOGIC;
    -- FOR CONTROL MEMORY
    TDDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    TASA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    TBSB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    MB : OUT STD_LOGIC;
    FS : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    MD : OUT STD_LOGIC;
    RW : OUT STD_LOGIC;
    MM : OUT STD_LOGIC;
    MW : OUT STD_LOGIC;
    Address : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)  
    );
    END COMPONENT;
   signal dataIn : STD_LOGIC_VECTOR (15 DOWNTO 0); --FROM MEMORY
   signal Z,N,C,V : STD_LOGIC; --FROM DATAPATH
   signal clock :  STD_LOGIC; --FROM OUTSIDE WORD
   signal pc_reset :  STD_LOGIC; -- FOR PROGRAM COUNTER 
   signal car_reset : STD_LOGIC;
   -- FOR CONTROL MEMORY
   signal TDDR :  STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal TASA :  STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal TBSB :  STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal MB :  STD_LOGIC;
   signal FS :  STD_LOGIC_VECTOR (4 DOWNTO 0);
   signal MD :  STD_LOGIC;
   signal RW :  STD_LOGIC;
   signal MM :  STD_LOGIC;
   signal MW :  STD_LOGIC;
   signal Address :  STD_LOGIC_VECTOR (15 DOWNTO 0);
   CONSTANT clk_period : TIME := 10 ns;
   
begin
    uut : controlUnit PORT MAP(
		dataIn => dataIn,
		Z => Z,
		N => N,
		C => C,
		V => V,
		clock => clock,
		pc_reset => pc_reset,
		car_reset => car_reset,
		TDDR => TDDR,
		TASA => TASA,
		TBSB => TBSB,
		MB => MB,
		FS => FS,
		MD => MD,
		RW => RW,
		MM => MM,
		MW => MW,
		Address => Address
	);
    clk_proc : PROCESS
        BEGIN
            clock <= '0';
            WAIT FOR clk_period/2;
            clock <= '1';
            WAIT FOR clk_period/2;
        END PROCESS;
    
    	stim_proc : PROCESS
        BEGIN
        dataIn <= "0000000"& "000" & "000" &"000";
        Z <= '0';
        N <= '0';
        C <= '0';
        V <= '0';    
        car_reset <='1';
        WAIT FOR clk_period ;
        car_reset <= '0';
        dataIn <= "0000001"& "010" & "001" &"100";
         --OPCODE &  DR   &  SA  &  SB
        WAIT;
        END PROCESS;
end Behavioral;

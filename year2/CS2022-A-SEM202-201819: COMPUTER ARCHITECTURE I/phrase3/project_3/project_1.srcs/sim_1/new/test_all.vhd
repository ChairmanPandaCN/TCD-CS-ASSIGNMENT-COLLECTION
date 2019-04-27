LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_all IS
	--Port ();
END test_all;

ARCHITECTURE Behavioral OF test_all IS
	COMPONENT dataPath
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
	END COMPONENT;
	--INPUT
	SIGNAL CLK : STD_LOGIC;
	SIGNAL CW : STD_LOGIC_VECTOR (16 DOWNTO 0);
	SIGNAL DataIn : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL ConstantIn : STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	--OUTPUT
	SIGNAL V : STD_LOGIC :='0';
	SIGNAL C : STD_LOGIC :='0';
	SIGNAL N : STD_LOGIC :='0';
	SIGNAL Z : STD_LOGIC :='0';
	SIGNAL AddressOut : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL dataOut : STD_LOGIC_VECTOR (15 DOWNTO 0);
	constant clk_period    : time := 20ns;
BEGIN
	uut : dataPath
	PORT MAP(
	    clk=>clk,
		CW => CW, 
		DataIn => DataIn, 
		ConstantIn => ConstantIn, 
		V => V, 
		C => C, 
		N => C, 
		Z => Z, 
		AddressOut => AddressOut, 
		dataOut => dataOut
	);
    clk_proc : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
	stim_proc : PROCESS
	BEGIN
		--load decimal 2 into register 02;
		DataIn <= "0000000000000010"; 
		CW <= "01000000000000011";
		--ConstantIn <= "0000000000000011";
		WAIT for 50 ns;		    
		CW <="00001000000000000";
		WAIT for 50 ns;
		
		--load decimal 3 into register 03
		DataIn <= "0000000000000011"; 
		CW <= "01100000000000011";
		WAIT for 50 ns;
		CW <="00001100000000000";
        WAIt for 50ns;
        
        --R1=R2+R3
        CW <="00101001100001001";
        WAIT for 50 ns;
        CW <="00000100000000000";
        WAIT for 50 ns;
        
        --R4=R2+Constant
        ConstantIn <= "0000000000000100";
		CW <="10001000010001001";
		WAIT for 50 ns;
		CW <="00010000000000000";
        WAIT for 50 ns;
        
        --R5= NOT R4
        CW <="10110000000111001";
        wait for 50 ns;
        CW <="00010100000000000";
        WAIT FOR 50 NS;
        
        -- R6=R2 SR
        CW <="11000001001010001";
        wait for 50 ns;
        CW <="00011000000000000";
        WAIT;
	END PROCESS;
END Behavioral;
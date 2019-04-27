LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test_InstructionRegister IS
	--  Port ( );
END test_InstructionRegister;

ARCHITECTURE Behavioral OF test_InstructionRegister IS
	COMPONENT InstructionRegister
		PORT (
			instruction : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			IL : IN STD_LOGIC;
			clock : IN STD_LOGIC;
			DR : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			SA : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			SB : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			OPCODE : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
		END COMPONENT;
		SIGNAL instruction : STD_LOGIC_VECTOR (15 DOWNTO 0);
		SIGNAL IL : STD_LOGIC;
		SIGNAL clock : STD_LOGIC;
		SIGNAL DR : STD_LOGIC_VECTOR (2 DOWNTO 0);
		SIGNAL SA : STD_LOGIC_VECTOR (2 DOWNTO 0);
		SIGNAL SB : STD_LOGIC_VECTOR (2 DOWNTO 0);
		SIGNAL OPCODE : STD_LOGIC_VECTOR (7 DOWNTO 0);
		CONSTANT clk_period : TIME := 4 ns;
	BEGIN
	
	uut : InstructionRegister PORT MAP(
            instruction => instruction,
            IL => IL,
            clock => clock,
            DR => DR,
            SA => SA,
            SB => SB,
            OPCODE => OPCODE
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
                instruction <= X"FFFF";
                IL <= '0';
                WAIT FOR 4 ns ;
                IL <='1';
                wait for 4 ns;
                WAIT;
            END PROCESS;
	END Behavioral;
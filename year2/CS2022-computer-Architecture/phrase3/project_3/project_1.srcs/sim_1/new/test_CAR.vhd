library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_CAR is
--  Port ( );
end test_CAR;

architecture Behavioral of test_CAR is
    COMPONENT CAR 
    PORT(
    	OPCODE : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        notNextInstruction : IN STD_LOGIC;
        clock : IN std_logic;
        output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
    END COMPONENT;
    
    SIGNAL OPCODE : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL notNextInstruction : STD_LOGIC;
    SIGNAL clock : STD_LOGIC;
    SIGNAL output : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Clock
    constant clk_period : time := 4 ns;
    
begin
    uut: CAR port map(
   OPCODE => OPCODE,
   notNextInstruction => notNextInstruction,
   clock => clock,
   output =>output
);
     clk_proc: process
   begin
       clock <='0';
       wait for clk_period/2;
       clock <='1';
       wait for clk_period/2;
   end process;

   stim_proc: process
   begin
   --initialize the car
   OPCODE <= "00000010";
   notNextInstruction <='1';
   wait for 2 ns;
   
   --
   notNextInstruction <='0';
   wait for 2 ns;
   
   --
   notNextInstruction <='1';
    OPCODE <= "11111111";
   wait;
   end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_MUX2 is
--  Port ( );
end test_MUX2;

architecture Behavioral of test_MUX2 is
 COMPONENT MUX2_16bit 
    PORT (
     In0 : IN std_logic_vector(15 DOWNTO 0);
     In1 : IN std_logic_vector(15 DOWNTO 0);
     S0 : IN std_logic;
     Z : OUT std_logic_vector(15 DOWNTO 0)
     );
     end component;
     
     signal In0,In1,Z : std_logic_vector(15 DOWNTO 0);
     signal S0 :  std_logic;
begin
    uut : MUX2_16bit 
    port map(
        In0=>In0,
        In1=>In1,
        S0=>S0,
        Z=>Z
    );
    stim_proc : PROCESS
	BEGIN
	   In0<="0000000000000001";
	    In1<="0000000000000011";
	    S0<='1';
		WAIT for 20 ns;
		
		 S0<='0';
		WAIT;
	END PROCESS;

end Behavioral;

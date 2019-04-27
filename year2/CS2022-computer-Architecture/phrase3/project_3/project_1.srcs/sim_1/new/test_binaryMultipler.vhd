------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 26.04.2019 21:45:18
---- Design Name: 
---- Module Name: test_binaryMultipler - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity test_binaryMultipler is
----  Port ( );
--end test_binaryMultipler;

--architecture Behavioral of test_binaryMultipler is
--    component binaryMultipler port(
--         multipler : IN std_logic_vector(3 downto 0);
--         multiplicand : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--         RESET : IN STD_LOGIC ;
--         G : IN STD_LOGIC;
--         RESULT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--         clk : in std_logic;
--         load_multipler : in std_logic;
--         load_multiplicand : in std_logic    
--    );
--    end component;
--  CONSTANT clk_period : TIME := 4 ns;
  
--begin
--    uut : binaryMultipler PORT MAP(
--	     multipler => multipler,
--         multiplicand =>multiplicand,
--         RESET => RESET,
--         G =>G,
--         RESULT=> RESULT,
--         clk =>clk,
--         load_multipler=> load_multipler,
--         load_multiplicand=>load_multiplicand    
--	);
--	clk_proc : PROCESS
--	BEGIN
--		clk <= '0';
--		WAIT FOR clk_period/2;
--		clk <= '1';
--		WAIT FOR clk_period/2;
--	END PROCESS;

--end Behavioral;

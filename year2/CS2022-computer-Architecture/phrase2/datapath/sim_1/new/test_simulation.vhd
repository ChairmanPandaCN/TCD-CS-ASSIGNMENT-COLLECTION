library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is

component register_file
    Port ( 	
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

--Inputs
signal A_src_s0: STD_LOGIC ;
signal A_src_s1: STD_LOGIC ;
signal A_src_s2: STD_LOGIC ;
signal B_src_s0: STD_LOGIC ;
signal B_src_s1: STD_LOGIC ;
signal B_src_s2: STD_LOGIC ;
signal load : STD_LOGIC ;
signal des_A0: STD_LOGIC ;
signal des_A1: STD_LOGIC ;
signal des_A2: STD_LOGIC ;
signal clk: STD_LOGIC ;
signal bus_D: STD_LOGIC_VECTOR (15 downto 0) ;

--Outputs
signal A_data: STD_LOGIC_VECTOR (15 downto 0) ;
signal B_data: STD_LOGIC_VECTOR (15 downto 0) ;

--Clock
constant clk_period : time := 10 ns;

begin

--Intantiate the Unit Under Test
uut: register_file port map(
    A_src_s0=>A_src_s0,
    A_src_s1=>A_src_s1,
    A_src_s2=>A_src_s2,
    B_src_s0=>B_src_s0,
    B_src_s1=>B_src_s1,
    B_src_s2=>B_src_s2,
    load=>load,
    des_A0=>des_A0,
    des_A1=>des_A1,
    des_A2=>des_A2,
    Clk=>clk,
    Bus_D=>Bus_D,
    A_data=>A_data,
    B_data=>B_data 
);

    clk_proc: process
    begin
        clk <='0';
        wait for clk_period/2;
        clk <='1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        load<='1';
        --load decimal 0 into register 00;
        Bus_D<="0000000000000000";
        des_A0<='0';
        des_A1<='0';
        des_A2<='0';
        wait for 20 ns;
        
        --load decimal 1 into register 01;
        Bus_D<="0000000000000001";
        des_A0<='1';
        des_A1<='0';
        des_A2<='0';
        wait for 20 ns;
        
        --load decimal 2 into register 02;
        Bus_D<="0000000000000010";
        des_A0<='0';
        des_A1<='1';
        des_A2<='0';
        wait for 20 ns;
        
        --load decimal 3 into register 03;
        Bus_D<="0000000000000011";
        des_A0<='1';
        des_A1<='1';
        des_A2<='0';
        wait for 20 ns;
        
        
        --load decimal 4 into register 04;
        Bus_D<="0000000000000100";
        des_A0<='0';
        des_A1<='0';
        des_A2<='1';
        wait for 20 ns;
        
        --load decimal 5 into register 05;
        Bus_D<="0000000000000101";
        des_A0<='1';
        des_A1<='0';
        des_A2<='1';
        wait for 20 ns;
        
        --load decimal 6 into register 06;
        Bus_D<="0000000000000110";
        des_A0<='0';
        des_A1<='1';
        des_A2<='1';
        wait for 20 ns;
        
         --load decimal 7 into register 07;
        Bus_D<="0000000000000111";
        des_A0<='1';
        des_A1<='1';
        des_A2<='1';
        wait for 20 ns;
        
        --load R7 into Bus B
        A_src_s0<='1';
        A_src_s1<='1';
        A_src_s2<='1';
        wait for 20 ns;
        
        --load R6 into Bus A
        B_src_s0<='0';
        B_src_s1<='1';
        B_src_s2<='1';
        wait for 20 ns;
        
        
         --load R5 into Bus B
        A_src_s0<='1';
        A_src_s1<='0';
        A_src_s2<='1';
        wait for 20 ns;
        
        --load R4 into Bus A
        B_src_s0<='0';
        B_src_s1<='0';
        B_src_s2<='1';
        wait for 20 ns;
        
        --load R3 into Bus B
        A_src_s0<='1';
        A_src_s1<='1';
        A_src_s2<='0';
        wait for 20 ns;
        
        --load R2 into Bus A
        B_src_s0<='0';
        B_src_s1<='1';
        B_src_s2<='0';
        wait for 20 ns;
        
        --load R1 into Bus B
        A_src_s0<='1';
        A_src_s1<='0';
        A_src_s2<='0';
        wait for 20 ns;
        
        --load R0 into Bus A
        B_src_s0<='0';
        B_src_s1<='0';
        B_src_s2<='0';
        wait;
        
    end process;

end Behavioral;

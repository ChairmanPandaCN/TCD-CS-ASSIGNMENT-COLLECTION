

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is

component register_file
    Port ( src_s0 : in STD_LOGIC;
           src_s1 : in STD_LOGIC;
           src_s2 : in STD_LOGIC;
           des_A0 : in STD_LOGIC;
           des_A1 : in STD_LOGIC;
           des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           data_src : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (15 downto 0);
           reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           reg7 : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--Inputs
signal src_s0: STD_LOGIC := '0';
signal src_s1: STD_LOGIC := '0';
signal src_s2: STD_LOGIC := '0';
signal des_A0: STD_LOGIC := '0';
signal des_A1: STD_LOGIC := '0';
signal des_A2: STD_LOGIC := '0';
signal clk: STD_LOGIC := '0';
signal data_src: STD_LOGIC := '0';
signal data: STD_LOGIC_VECTOR (15 downto 0) := (others=>'0');

--Outputs
signal reg0: STD_LOGIC_VECTOR (15 downto 0);
signal reg1: STD_LOGIC_VECTOR (15 downto 0);
signal reg2: STD_LOGIC_VECTOR (15 downto 0);
signal reg3: STD_LOGIC_VECTOR (15 downto 0);
signal reg4: STD_LOGIC_VECTOR (15 downto 0);
signal reg5: STD_LOGIC_VECTOR (15 downto 0);
signal reg6: STD_LOGIC_VECTOR (15 downto 0);
signal reg7: STD_LOGIC_VECTOR (15 downto 0);

--Clock
constant clk_period : time := 10 ns;

begin

--Intantiate the Unit Under Test
uut: register_file port map(
    src_s0 => src_s0,
    src_s1 => src_s1,
    src_s2 => src_s2,
    des_A0 => des_A0,
    des_A1 => des_A1,
    des_A2 => des_A2,
    clk => clk,
    data_src => data_src,
    data => data,
    reg0 => reg0,
    reg1 => reg1,
    reg2 => reg2,
    reg3 => reg3,
    reg4 => reg4,
    reg5 => reg5,
    reg6 => reg6,
    reg7 => reg7
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
    
        --test the s is 0 for mux2_16bit, so the mux2_16bit's output depends on the input data, the mux8_16bit is not working
        data_src<='0';
        
        data<=x"0000";
        des_A0<='0';
        des_A1<='0';
        des_A2<='0';
        wait for clk_period;
        
        data<=x"0001";
        des_A0<='0';
        des_A1<='0';
        des_A2<='1';
        wait for clk_period;
        
        data<=x"0002";
        des_A0<='0';
        des_A1<='1';
        des_A2<='0';
        wait for clk_period;
        
        data<=x"0003";
        des_A0<='0';
        des_A1<='1';
        des_A2<='1';
        wait for clk_period;
        
        data<=x"0004";
        des_A0<='1';
        des_A1<='0';
        des_A2<='0';
        wait for clk_period;
        
        data<=x"0005";
        des_A0<='1';
        des_A1<='0';
        des_A2<='1';
        wait for clk_period;
        
        data<=x"0006";
        des_A0<='1';
        des_A1<='1';
        des_A2<='0';
        wait for clk_period;
        
        data<=x"0007";
        des_A0<='1';
        des_A1<='1';
        des_A2<='1';
        wait for clk_period;
        
        --load the value in r0 to r1
        data_src<='1';
        des_A0<='0';
        des_A1<='0';
        des_A2<='1';
        src_s0<='0';
        src_s1<='0';
        src_s2<='0';
        wait for clk_period;
        
       --load the value in r0 to r6
        data_src<='1';
        des_A0<='1';
        des_A1<='0';
        des_A2<='0';
        src_s0<='0';
        src_s1<='0';
        src_s2<='0';
        wait for clk_period;
        
       --load the value in r7 to r6
        data_src<='1';
        des_A0<='1';
        des_A1<='1';
        des_A2<='0';
        src_s0<='1';
        src_s1<='1';
        src_s2<='1';
        wait for clk_period;
        
       --load the value in r7 to r5
        data_src<='1';
        des_A0<='1';
        des_A1<='0';
        des_A2<='1';
        src_s0<='1';
        src_s1<='1';
        src_s2<='1';
        wait;
        
    end process;

end Behavioral;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY register_file IS
	PORT (
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
		b_data : out std_logic_vector(15 DOWNTO 0);
		reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7 :out std_logic_vector(15 DOWNTO 0)
	);
END register_file;

ARCHITECTURE Behavioral OF register_file IS

	COMPONENT reg16
		PORT (
			D : IN std_logic_vector(15 DOWNTO 0);
			load, Clk : IN std_logic;
			Q : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decoder_3to8
		PORT (
			A0 : IN std_logic;
			A1 : IN std_logic;
			A2 : IN std_logic;
			Q0 : OUT std_logic;
			Q1 : OUT std_logic;
			Q2 : OUT std_logic;
			Q3 : OUT std_logic;
			Q4 : OUT std_logic;
			Q5 : OUT std_logic;
			Q6 : OUT std_logic;
			Q7 : OUT std_logic
		);
	END COMPONENT;
	COMPONENT mux8_16bit
		PORT (
			In0 : IN std_logic_vector(15 DOWNTO 0);
			In1 : IN std_logic_vector(15 DOWNTO 0);
			In2 : IN std_logic_vector(15 DOWNTO 0);
			In3 : IN std_logic_vector(15 DOWNTO 0);
			In4 : IN std_logic_vector(15 DOWNTO 0);
			In5 : IN std_logic_vector(15 DOWNTO 0);
			In6 : IN std_logic_vector(15 DOWNTO 0);
			In7 : IN std_logic_vector(15 DOWNTO 0);
			S0, S1, S2 : IN std_logic;
			Z : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
    COMPONENT load_enable 
        port(
            In0 : in std_logic;
            In1 : in std_logic;
            enable : out std_logic
        );
    end component;
    SIGNAL choose_reg0,choose_reg1,choose_reg2,choose_reg3,choose_reg4,choose_reg5,choose_reg6,choose_reg7 : std_logic;
	SIGNAL load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
	SIGNAL reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q: std_logic_vector(15 DOWNTO 0);
BEGIN
    des_decoder_3to8 : decoder_3to8
	PORT MAP(
		A0 => des_A0,  
		A1 => des_A1, 
		A2 => des_A2, 
		Q0 => choose_reg0, 
		Q1 => choose_reg1, 
		Q2 => choose_reg2, 
		Q3 => choose_reg3, 
		Q4 => choose_reg4, 
		Q5 => choose_reg5, 
		Q6 => choose_reg6, 
		Q7 => choose_reg7
	);
    load_enable00 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg0,
        enable=>load_reg0
    );
    load_enable01 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg1,
        enable=>load_reg1
    );    
    load_enable02 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg2,
        enable=>load_reg2
    );
    load_enable03 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg3,
        enable=>load_reg3
    );
    load_enable04 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg4,
        enable=>load_reg4
    );
    load_enable05 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg5,
        enable=>load_reg5
    );
    load_enable06 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg6,
        enable=>load_reg6
    );
    load_enable07 : load_enable
    port map(
        In0=>load,
        In1=>choose_reg7,
        enable=>load_reg7
    );
	register00 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg0, 
		Clk => Clk, 
		Q => reg0_q
	);

	register01 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg1, 
		Clk => Clk, 
		Q => reg1_q
	);
	register02 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg2, 
		Clk => Clk, 
		Q => reg2_q
	);
	register03 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg3, 
		Clk => Clk, 
		Q => reg3_q
	);
	register04 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg4, 
		Clk => Clk, 
		Q => reg4_q
	);
	register05 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg5, 
		Clk => Clk, 
		Q => reg5_q
	);
	register06 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg6, 
		Clk => Clk, 
		Q => reg6_q
	);
	register07 : reg16
	PORT MAP(
		D => Bus_D, 
		load => load_reg7, 
		Clk => Clk, 
		Q => reg7_q
	);
	A_mux8_16bit : mux8_16bit
	PORT MAP(
		In0 => reg0_q, 
		In1 => reg1_q, 
		In2 => reg2_q, 
		In3 => reg3_q, 
		In4 => reg4_q, 
		In5 => reg5_q, 
		In6 => reg6_q, 
		In7 => reg7_q, 
		S0 => A_src_s0, 
		S1 => A_src_s1, 
		S2 => A_src_s2, 
		Z => A_data
	);
	B_mux8_16bit : mux8_16bit
	PORT MAP(
		In0 => reg0_q, 
		In1 => reg1_q, 
		In2 => reg2_q, 
		In3 => reg3_q, 
		In4 => reg4_q, 
		In5 => reg5_q, 
		In6 => reg6_q, 
		In7 => reg7_q, 
		S0 => B_src_s0, 
		S1 => B_src_s1, 
		S2 => B_src_s2, 
		Z => B_data
	);
	reg0<=reg0_q;
	reg1<=reg1_q;
	reg2<=reg2_q;
	reg3<=reg3_q;
	reg4<=reg4_q;
    reg5<=reg5_q;
    reg6<=reg6_q;
    reg7<=reg7_q;
END Behavioral;
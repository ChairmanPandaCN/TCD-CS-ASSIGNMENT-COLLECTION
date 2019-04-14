

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_shifter is
--  Port ( );
end test_shifter;

architecture Behavioral of test_shifter is
 component Shifter is
 port(
   B : IN std_logic_vector(15 downto 0);
   H : OUT std_logic_vector(15 downto 0);
   S0,S1 : IN std_logic;
   left,right : IN std_logic :='0'
 ); 
 end component;
 
 signal B : STD_LOGIC_VECTOR (15 DOWNTO 0);
 SIGNAL H:  STD_LOGIC_VECTOR (15 DOWNTO 0);
 SIGNAL S0: STD_LOGIC;
 SIGNAL S1: STD_LOGIC;
begin

uut: shifter port map(
    B=>B,
    S0=>S0,
    S1=>S1,
    H=>H
    );
stim_proc: process
    begin
    B <= "0000000000000010";
    S0<='1';
    S1<='0';
    wait for 5 ns;
    
    S0<='0';
    S1<='1';
    wait;
       
    end process;
end Behavioral;

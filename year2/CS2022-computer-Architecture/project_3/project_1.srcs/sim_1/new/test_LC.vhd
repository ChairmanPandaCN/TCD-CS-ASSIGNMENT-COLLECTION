library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity test_LC is
--  Port ( );
end test_LC;

architecture Behavioral of test_LC is
 COMPONENT LC IS 
  Port (
   A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
   S0 : IN STD_LOGIC;
   S1 : IN STD_LOGIC;
   G : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;
   SIGNAL A : STD_LOGIC_VECTOR (15 DOWNTO 0) := (others=>'0');
   SIGNAL B : STD_LOGIC_VECTOR (15 DOWNTO 0) := (others=>'0');
   SIGNAL S0 : STD_LOGIC := '0';
   SIGNAL S1 : STD_LOGIC := '0';
   SIGNAL G : STD_LOGIC_VECTOR (15 DOWNTO 0):= (others=>'0');
begin
--Intantiate the Unit Under Test
uut: LC port map(
    A => A,
    B => B,   
    S0=>S0,
    S1=>S1,
    G=>G
);
stim_proc: process
    begin
    A <="0000000000000001";
    B <="0000000000000000";
    --test and gate
    S0 <='0';
    S1 <='0';
    wait for 5 ns;
    
     --test or gate
    S0 <='1';
    S1 <='0';
    wait for 5 ns;
    
      --test xor gate
     B <="0000000000000001";  
    S0 <='0';
    S1 <='1';
    wait for 5 ns;
      --test or gate
    S0 <='1';
    S1 <='1';
    wait;
    
    end process;
end Behavioral;

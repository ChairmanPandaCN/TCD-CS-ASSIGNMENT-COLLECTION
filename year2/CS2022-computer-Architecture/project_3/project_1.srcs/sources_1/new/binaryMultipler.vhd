LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binaryMultipler is
    Port (
       multipler : IN std_logic_vector(3 downto 0);
       multiplicand : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       RESET : IN STD_LOGIC ;
       G : IN STD_LOGIC;
       RESULT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       clk : in std_logic;
       load_multipler : in std_logic;
       load_multiplicand : in std_logic    
     );
end binaryMultipler;

architecture Behavioral of binaryMultipler is
    type state IS (IDLE,MUL0,MUL1);
    SIGNAL currentState,nextState : state;
    signal A, B, Q: std_logic_vector(3 downto 0);
    signal P: std_logic_vector(1 downto 0);
    signal C, Z: std_logic;
begin
    Z <= P(1) NOR P(0);
	RESULT  <= A & Q;
	
    currentStateUpdate : process(clk)
    begin
        IF (RESET = '1') then
        currentState <= IDLE;
        elsif (rising_edge(clk)) then
        currentState<= nextState;
        end if;     
    end Process;
     
    nextStateChange : process(clk)
    begin
    IF (rising_edge(clk))then
      CASE currentState IS
       WHEN IDLE =>
           IF G='1' THEN
             nextState <=MUL0;
           ELSE 
                nextState <=IDLE;
           END IF;
           
       WHEN MUL0 =>
            NextState <= MUL1;
       
       WHEN MUL1 =>
            IF Z ='1' THEN
                nextState <= IDLE;
            else 
                nextState <=MUL0;
            END IF;
        END CASE;
        end if;
    end process;
    
    calculation : process(clk)
        variable CA : STD_LOGIC_VECTOR (5 downto 0);
    begin
     if( rising_edge(clk)) then
      IF (load_multipler = '1') then
      Q <=multipler;
      end if;
      
      IF (load_multiplicand = '1') then
      B <= multiplicand;
      end if; 
      
      case currentState is 
       WHEN IDLE=>
            IF (G='1') THEN
            C <= '0';
            A <= "00000000";
            P <= "11";
            end if;
        
       when MUL0 =>
            IF(Q(0)='1') THEN
            CA := CA + ('0'&B);
            END IF;
       C <= CA(4);
       A <= CA(3 DOWNTO 0);    
       when MUL1 =>
       C <= '0';
       A <= C & A (3 DOWNTO 1);
       Q <= A(0) & Q(3 DOWNTO 1);
       P <= P - "01";           
      end case;          
   end if;
   END PROCESS;
end Behavioral;

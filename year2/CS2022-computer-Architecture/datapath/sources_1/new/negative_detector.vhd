LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity negative_detector is
  Port (
  G : IN STD_LOGIC_VECTOR( 15 DOWNTO 0);
  N : OUT STD_LOGIC
   );
end negative_detector;

architecture Behavioral of negative_detector is
begin
 N <= '1' after 1 ns when G(15)='1' else
      '0' after 1 ns;

end Behavioral;
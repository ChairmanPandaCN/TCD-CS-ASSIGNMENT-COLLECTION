LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detector is
  Port (
  G : IN STD_LOGIC_VECTOR( 15 DOWNTO 0);
  Z : OUT STD_LOGIC
   );
end zero_detector;

architecture Behavioral of zero_detector is
begin
 Z <= '1' after 1 ns when G="0000000000000000" else
      '0' after 1 ns;

end Behavioral;

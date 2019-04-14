LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity load_enable is
Port (
In0 : in std_logic;
In1 : in std_logic;
enable : out std_logic
 );
end load_enable;

architecture Behavioral of load_enable is
begin

enable <= '1' after 1 ns when In0='1' and In1='1' else
          '0' after 1 ns;

end Behavioral;

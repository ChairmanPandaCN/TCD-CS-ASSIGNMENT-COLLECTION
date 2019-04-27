
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Shifter is
  PORT(
   B : IN std_logic_vector(15 downto 0);
   H : OUT std_logic_vector(15 downto 0);
   S0,S1 : IN std_logic;
   left,right : IN std_logic :='0'
   
  );
end Shifter;

architecture Behavioral of Shifter is
    component mux3_1bit 
    PORT (  
	In0 : IN std_logic;
	In1 : IN std_logic;
	In2 : IN std_logic;
	S0 : IN std_logic;
	S1 : IN std_logic;
	Z : OUT std_logic
	);
	end component;
begin
  mux00 : mux3_1bit
  port map(
  In0=>B(0),
  In1=>B(1),
  In2=>right,
  S0=>S0,
  S1=>S1,
  Z=>H(0)
  );
  mux01 : mux3_1bit
  port map(
  In0=>B(1),
  In1=>B(2),
  In2=>B(0),
  S0=>S0,
  S1=>S1,
  Z=>H(1)
  );
  mux02 : mux3_1bit
  port map(
  In0=>B(2),
  In1=>B(3),
  In2=>B(1),
  S0=>S0,
  S1=>S1,
  Z=>H(2)
  );
  mux03 : mux3_1bit
  port map(
  In0=>B(3),
  In1=>B(4),
  In2=>B(2),
  S0=>S0,
  S1=>S1,
  Z=>H(3)
  );
  mux04 : mux3_1bit
  port map(
  In0=>B(4),
  In1=>B(5),
  In2=>B(3),
  S0=>S0,
  S1=>S1,
  Z=>H(4)
  );
    mux05 : mux3_1bit
  port map(
  In0=>B(5),
  In1=>B(6),
  In2=>B(4),
  S0=>S0,
  S1=>S1,
  Z=>H(5)
  );
      mux06 : mux3_1bit
  port map(
  In0=>B(6),
  In1=>B(7),
  In2=>B(5),
  S0=>S0,
  S1=>S1,
  Z=>H(6)
  );
        mux07 : mux3_1bit
  port map(
  In0=>B(7),
  In1=>B(8),
  In2=>B(6),
  S0=>S0,
  S1=>S1,
  Z=>H(7)
  );
          mux08 : mux3_1bit
  port map(
  In0=>B(8),
  In1=>B(9),
  In2=>B(7),
  S0=>S0,
  S1=>S1,
  Z=>H(8)
  );
            mux09 : mux3_1bit
  port map(
  In0=>B(9),
  In1=>B(10),
  In2=>B(8),
  S0=>S0,
  S1=>S1,
  Z=>H(9)
  );
              mux10 : mux3_1bit
  port map(
  In0=>B(10),
  In1=>B(11),
  In2=>B(9),
  S0=>S0,
  S1=>S1,
  Z=>H(10)
  );
  
                mux11 : mux3_1bit
  port map(
  In0=>B(11),
  In1=>B(12),
  In2=>B(10),
  S0=>S0,
  S1=>S1,
  Z=>H(11)
  );
                  mux12 : mux3_1bit
  port map(
  In0=>B(12),
  In1=>B(13),
  In2=>B(11),
  S0=>S0,
  S1=>S1,
  Z=>H(12)
  );
  
                    mux13 : mux3_1bit
  port map(
  In0=>B(13),
  In1=>B(14),
  In2=>B(12),
  S0=>S0,
  S1=>S1,
  Z=>H(13)
  );
                      mux14 : mux3_1bit
  port map(
  In0=>B(14),
  In1=>B(15),
  In2=>B(13),
  S0=>S0,
  S1=>S1,
  Z=>H(14)
  );
  
                        mux15 : mux3_1bit
  port map(
  In0=>B(15),
  In1=>left,
  In2=>B(14),
  S0=>S0,
  S1=>S1,
  Z=>H(15)
  );

end Behavioral;

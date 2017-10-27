
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity sumador2 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           npc : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador2;

architecture Behavioral of sumador2 is
signal disp3032: std_logic_vector(31 downto 0);

begin

process(disp30,npc)
begin
	if(disp30(29) = '0') then
		disp3032 <= "00" & disp30;
	else
		disp3032 <= "11" & disp30;
	end if;
	

end process;
output <= disp3032 + npc;

end Behavioral;


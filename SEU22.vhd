
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SEU22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           outSEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU22;

architecture Behavioral of SEU22 is

begin

process(disp22)
begin
	if(disp22(21) = '0') then
		outSEU <= "0000000000" & disp22;
	else
		outSEU <= "1111111111" & disp22;
	end if;
end process;


end Behavioral;


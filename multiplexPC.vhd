
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity multiplexPC is
    Port ( disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           pcSource : in  STD_LOGIC_VECTOR (1 downto 0);
           outMux : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexPC;

architecture Behavioral of multiplexPC is

begin

process(disp22,disp30,pc,ALUR,pcSource)
begin
	if(pcSource = "00") then--disp22
		outMux <= disp22;
	end if;
	if(pcSource = "01") then
		outMux <= disp30;
	end if;
	if(pcSource = "10") then
		outMux <= pc;
	end if;
	if(pcSource = "11") then
		outMux <= ALUR;
	end if;
end process;

end Behavioral;


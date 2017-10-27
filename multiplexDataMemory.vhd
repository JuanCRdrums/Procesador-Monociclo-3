
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiplexDataMemory is
    Port ( RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
           DATATOMEM : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           outMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexDataMemory;

architecture Behavioral of multiplexDataMemory is

begin

process(RFSource,DATATOMEM,ALUR,PC)
begin
	if(RFSource = "00") then--pasa lo que hay en memoria
		outMUX <= DATATOMEM;
	end if;
	if(RFSource = "01") then--pasa lo que hay en ALU
		outMUX <= ALUR;
	end if;
	if(RFSource = "10") then--pasa el PC
		outMUX <= pc;
	end if;
end process;

end Behavioral;


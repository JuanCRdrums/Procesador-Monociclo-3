
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity multiplexRF is
    Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
			  quince: in std_logic_vector(5 downto 0);
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end multiplexRF;

architecture Behavioral of multiplexRF is

begin

process(RD,RFDEST,quince)
begin
	if(RFDEST = '0') then
		nRD <= quince;
	end if;
	if(RFDEST = '1') then
		nRD <= RD;
	end if;
end process;

end Behavioral;


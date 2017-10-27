
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( 
           reset : in  STD_LOGIC;
           WriteEnable : in  STD_LOGIC;
           enableMem : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
			  CRd : in  STD_LOGIC_VECTOR (31 downto 0);
           DataValue : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;


architecture Behavioral of DataMemory is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal ramMemory : ram_type := (others => x"00000000");

begin

process(reset,WriteEnable,enableMem,Address,CRd)
begin
	if(enableMem = '1') then
		if(reset = '1') then
			DataValue <= (others => '0');
			ramMemory <= (others => x"00000000");
		else
			DataValue <= ramMemory(conv_integer(address(5 downto 0)));
		end if;
	end if;
	if(WriteEnable = '1') then
				ramMemory(conv_integer(address(5 downto 0))) <= CRd;
	end if;
		
end process;


end Behavioral;


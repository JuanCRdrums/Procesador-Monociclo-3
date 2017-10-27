
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

--use IEEE.NUMERIC_STD.ALL;
entity PSRModifier is
    Port ( D1: in STD_LOGIC_VECTOR(31 downto 0);
				D2: in std_logic_vector(31 downto 0);
				ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  OP: in STD_LOGIC_VECTOR(1 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0):="0000");
end PSRModifier;

architecture Behavioral of PSRModifier is



begin

process(ALUR)
begin
	if(OP = "10") then
		if(OP3 = "010000" or OP3 = "011000") then-- ADDcc or ADDXcc
			if(ALUR = "00000000000000000000000000000000") then
				NZVC(2) <= '1';
			end if;
			NZVC(3) <= ALUR(31);
			if((D1(31) = '1' and D2(31) = '1' and (not ALUR(31) = '1')) or ((not D1(31) = '1') and (not D2(31) = '1') and ALUR(31) = '1')) then
				NZVC(1) <= '1';
			end if;
			if((D1(31) = '1' and D2(31) = '1') or((not ALUR(31) = '1') and (D1(31) = '1' or D2(31) = '1'))) then
				NZVC(0) <= '1';
			end if;

		end if;
		if(OP3 = "010100" or OP3 = "011100") then-- SUBcc or SUBXcc
			--if(ALUR = "00000000000000000000000000000000") then
				--NZVC(2) <= '1';
			--end if;
			NZVC(3) <= ALUR(31);
			if((D1(31)= '1' and (not D2(31)= '1') and (not ALUR(31)= '1')) or ((not D1(31) = '1') and D2(31) = '1' and ALUR(31) = '1'))then
				NZVC(1) <= '1';
			end if;
			if( ((not D1(31)='1') and D2(31)='1') or (ALUR(31)='1' and ((not D1(31)='1') or D1(31)='1'))) then
				NZVC (0) <= '1';
			end if;

		end if;
	end if;
end process;

end Behavioral;


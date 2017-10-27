
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
				op2: in std_logic_vector(2 downto 0);
				icc: in std_logic_vector(3 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  cond: in std_logic_vector(3 downto 0);
			  RFDEST: out std_logic;
			  RFSOURCE: out std_logic_vector(1 downto 0);
			  WRENNEM: out std_logic;
			  RDENNEM: out std_logic;
			  weRF: out std_logic;
			  PCSOURCE: out std_logic_vector(1 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

process(op,op2,op3,cond,icc)
begin
	if(op = "01") then--CALL AND LINK
		RFDEST <= '0';
		RFSOURCE <= "10";
		PCSOURCE <= "01";
		WRENNEM <= '0';
		RDENNEM <= '0';
		aluop <= "111111";
		weRF <= '1';
	else
		if(op = "00") then
			if(op2 = "010") then
				case cond is
					
					when "1000" => --branch always
						weRF <= '0';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '0';
						RFSOURCE <= "01";
						aluop <= "111111";
						PCSOURCE <= "00";
						
					when "1001" => --branch on not equal
						if(icc(2) = '0') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";
						end if;
					
					when "0001" => --branch on equal
						if(icc(2) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";
						end if;
					
					when "1010" =>--branch on greater
						if(not((icc(2) = '1' or (icc(3) = '1' xor icc(1) = '1')))) then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;
					
					when "0010" => --branch on less equal
						if(icc(2) = '1' or (icc(3) = '1' xor icc(1) = '1')) then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;						
					
					when "1011" => --branch on greater or equal
						if(not(icc(2) = '1' xor icc(1) = '1')) then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;

					when "0011" => --branch on less
						if(icc(2) = '1' xor icc(1) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;

					when "1100" => --branch on greater unsigned
						if(icc(0) = '0' and icc(2) = '0') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;

					when "0100" => --branch on less or equal unsigned
						if(icc(0) = '1' or icc(2) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;

					when "1101" => --branch on carry clear
						if(icc(0) = '0') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;


					when "0101" => --branch on carry set
						if(icc(0) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;


					when "1110" => --branch on positive
						if(icc(3) = '0') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;


					when "0110" => --branch on negative
						if(icc(3) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;


					when "1111" => --branch on overflow clear
						if(icc(1) = '0') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;

					when "0111" => --branch on overflow set
						if(icc(1) = '1') then--salta
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "00";
						else
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";							
						end if;
							
					when others => --branch never
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";					
					
				end case;
			else
				
				if(op2 = "100") then--nop
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";						
				end if;
				
			end if;
			
		else
			if(op = "10") then
				
				case op3 is
					
					when "000000" => --ADD
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000000";
						PCSOURCE <= "10";
					
					when "000100" => --SUB
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000100";
						PCSOURCE <= "10";
						
					when "000001" => --AND
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000001";
						PCSOURCE <= "10";
						
					when "000010" => --OR
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000010";
						PCSOURCE <= "10";
						
					when "000101" => --ANDN
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000101";
						PCSOURCE <= "10";
						
					when "000110" => --ORN
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000110";
						PCSOURCE <= "10";
						
					when "000011" => --XOR
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000011";
						PCSOURCE <= "10";
					
					when "000111" => --XORN
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "000111";
						PCSOURCE <= "10";
						
					when "010000" => --ADDCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010000";
						PCSOURCE <= "10";
						
					when "011000" => --ADDXCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "011000";
						PCSOURCE <= "10";
						
					when "010100" => --SUBCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010100";
						PCSOURCE <= "10";

					when "011100" => --SUBXCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "011100";
						PCSOURCE <= "10";	

					when "010001" => --ANDCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010001";
						PCSOURCE <= "10";		

					when "010101" => --ANDNCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010101";
						PCSOURCE <= "10";

					when "010010" => --ORCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010010";
						PCSOURCE <= "10";

					when "010110" => --ORNCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010110";
						PCSOURCE <= "10";

					when "010011" => --XORCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010011";
						PCSOURCE <= "10";

					when "010111" => --XORNCC
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "010111";
						PCSOURCE <= "10";
						
					when "001000" => --ADDX
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "001000";
						PCSOURCE <= "10";

					when "001100" => --SUBX
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "001100";
						PCSOURCE <= "10";

					when "111101" => --RESTORE
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "111101";
						PCSOURCE <= "10";
						
					when "111100" => --SAVE
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "111100";
						PCSOURCE <= "10";
						
					when "100101" => --SLL
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "100101";
						PCSOURCE <= "10";
				
					when "100110" => --SRL
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "100110";
						PCSOURCE <= "10";
						
					when "100111" => --SRA
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "01";
						aluop <= "100111";
						PCSOURCE <= "10";
						
					when "111000" => --JMPL
						weRF <= '1';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '1';
						RFSOURCE <= "10";
						aluop <= "111000";
						PCSOURCE <= "11";
						
					when others => 
						weRF <= '0';
						WRENNEM <= '0';
						RDENNEM <= '0';
						RFDEST <= '0';
						RFSOURCE <= "01";
						aluop <= "111111";
						PCSOURCE <= "10";	
				end case;
			
			else
				
				if(op = "11") then
					case op3 is
					
						when "000100" => --st
							weRF <= '0';
							WRENNEM <= '1';
							RDENNEM <= '1';
							RFDEST <= '0';
							RFSOURCE <= "00";
							aluop <= "111111";
							PCSOURCE <= "10";
							
						when "000000" => --ld
							weRF <= '1';
							WRENNEM <= '0';
							RDENNEM <= '1';
							RFDEST <= '1';
							RFSOURCE <= "00";
							aluop <= "111111";
							PCSOURCE <= "10";

						when others =>
							weRF <= '0';
							WRENNEM <= '0';
							RDENNEM <= '0';
							RFDEST <= '0';
							RFSOURCE <= "01";
							aluop <= "111111";
							PCSOURCE <= "10";	
					end case;
				end if;
				
			end if;
		end if;
	end if;
end process;


end Behavioral;


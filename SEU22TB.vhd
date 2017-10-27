
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY SEU22TB IS
END SEU22TB;
 
ARCHITECTURE behavior OF SEU22TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU22
    PORT(
         disp22 : IN  std_logic_vector(21 downto 0);
         outSEU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal outSEU : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU22 PORT MAP (
          disp22 => disp22,
          outSEU => outSEU
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
		disp22 <= "1000000000000000000000";
		wait for 20 ns;
		disp22 <= "0111111111111111111111";

      -- insert stimulus here 

      wait;
   end process;

END;

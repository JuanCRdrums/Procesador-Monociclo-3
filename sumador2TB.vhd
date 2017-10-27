
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY sumador2TB IS
END sumador2TB;
 
ARCHITECTURE behavior OF sumador2TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador2
    PORT(
         disp30 : IN  std_logic_vector(29 downto 0);
         npc : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp30 : std_logic_vector(29 downto 0) := (others => '0');
   signal npc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador2 PORT MAP (
          disp30 => disp30,
          npc => npc,
          output => output
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      disp30 <= "000000000000000000000000000001";
		npc <= "00000000000000000000000000000010";

      -- insert stimulus here 

      wait;
   end process;

END;

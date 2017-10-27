
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

ENTITY multiplexRFTB IS
END multiplexRFTB;
 
ARCHITECTURE behavior OF multiplexRFTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexRF
    PORT(
         RD : IN  std_logic_vector(5 downto 0);
         RFDEST : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0);
			quince: in std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic_vector(5 downto 0) := (others => '0');
	signal quince : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDEST : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexRF PORT MAP (
          RD => RD,
          RFDEST => RFDEST,
          nRD => nRD,
			 quince => quince
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      RD <= "000001";
		quince <= "001111";
		RFDEST <= '0';
		wait for 20 ns;
		RFDEST <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;

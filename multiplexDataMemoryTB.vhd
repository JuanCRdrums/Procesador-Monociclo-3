
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--USE ieee.numeric_std.ALL;
 
ENTITY multiplexDataMemoryTB IS
END multiplexDataMemoryTB;
 
ARCHITECTURE behavior OF multiplexDataMemoryTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexDataMemory
    PORT(
         RFSource : IN  std_logic_vector(1 downto 0);
         DATATOMEM : IN  std_logic_vector(31 downto 0);
         ALUR : IN  std_logic_vector(31 downto 0);
         pc : IN  std_logic_vector(31 downto 0);
         outMUX : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RFSource : std_logic_vector(1 downto 0) := (others => '0');
   signal DATATOMEM : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUR : std_logic_vector(31 downto 0) := (others => '0');
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal outMUX : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexDataMemory PORT MAP (
          RFSource => RFSource,
          DATATOMEM => DATATOMEM,
          ALUR => ALUR,
          pc => pc,
          outMUX => outMUX
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      DATATOMEM <= "00000000000000000000000000000001";
		ALUR <= "00000000000000000000000000000010";
		pc <= "00000000000000000000000000000011";
		RFSource <= "00";
		wait for 20 ns;
		RFSource <= "01";
		wait for 20 ns;
		RFSource <= "10";

      

      -- insert stimulus here 

      wait;
   end process;

END;

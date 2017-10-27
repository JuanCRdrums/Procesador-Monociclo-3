
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY multiplexPCTB IS
END multiplexPCTB;
 
ARCHITECTURE behavior OF multiplexPCTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexPC
    PORT(
         disp22 : IN  std_logic_vector(31 downto 0);
         disp30 : IN  std_logic_vector(31 downto 0);
         pc : IN  std_logic_vector(31 downto 0);
         ALUR : IN  std_logic_vector(31 downto 0);
         pcSource : IN  std_logic_vector(1 downto 0);
         outMux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp22 : std_logic_vector(31 downto 0) := (others => '0');
   signal disp30 : std_logic_vector(31 downto 0) := (others => '0');
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUR : std_logic_vector(31 downto 0) := (others => '0');
   signal pcSource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal outMux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexPC PORT MAP (
          disp22 => disp22,
          disp30 => disp30,
          pc => pc,
          ALUR => ALUR,
          pcSource => pcSource,
          outMux => outMux
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      disp22 <= "00000000000000000000000000000001";
		disp30 <= "00000000000000000000000000000010";
		pc <= "00000000000000000000000000000011";
		ALUR <= "00000000000000000000000000000100";
		pcSource <= "00";
		wait for 20 ns;
		pcSource <= "01";
		wait for 20 ns;
		pcSource <= "10";
		wait for 20 ns;
		pcSource <= "11";
		

      -- insert stimulus here 

      wait;
   end process;

END;

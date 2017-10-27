LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY DataMemoryTB IS
END DataMemoryTB;
 
ARCHITECTURE behavior OF DataMemoryTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         reset : IN  std_logic;
         WriteEnable : IN  std_logic;
         enableMem : IN  std_logic;
         Address : IN  std_logic_vector(31 downto 0);
         CRd : IN  std_logic_vector(31 downto 0);
         DataValue : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal WriteEnable : std_logic := '0';
   signal enableMem : std_logic := '0';
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal CRd : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DataValue : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          reset => reset,
          WriteEnable => WriteEnable,
          enableMem => enableMem,
          Address => Address,
          CRd => CRd,
          DataValue => DataValue
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '1';
		WriteEnable <= '1';
		enableMem <= '0';
		wait for 20 ns;
		reset <= '0';
		CRd <= "00000000000000000000000000000001";
		Address <= "00000000000000000000000000000000";
		wait for 20 ns;
		WriteEnable <= '0';
		enableMem <= '1';
		wait for 20 ns;
		WriteEnable <= '1';
		CRd <= "00000000000000000000000000000010";
		Address <= "00000000000000000000000000000001";
		wait for 20 ns;
		WriteEnable <= '0';
		
		
		
		

      -- insert stimulus here 

      wait;
   end process;

END;

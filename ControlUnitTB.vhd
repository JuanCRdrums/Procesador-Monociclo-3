
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY ControlUnitTB IS
END ControlUnitTB;
 
ARCHITECTURE behavior OF ControlUnitTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op2 : IN  std_logic_vector(2 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         aluop : OUT  std_logic_vector(5 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         RFDEST : OUT  std_logic;
         RFSOURCE : OUT  std_logic_vector(1 downto 0);
         WRENNEM : OUT  std_logic;
         RDENNEM : OUT  std_logic;
         weRF : OUT  std_logic;
         PCSOURCE : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal aluop : std_logic_vector(5 downto 0);
   signal RFDEST : std_logic;
   signal RFSOURCE : std_logic_vector(1 downto 0);
   signal WRENNEM : std_logic;
   signal RDENNEM : std_logic;
   signal weRF : std_logic;
   signal PCSOURCE : std_logic_vector(1 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op => op,
          op2 => op2,
          icc => icc,
          op3 => op3,
          aluop => aluop,
          cond => cond,
          RFDEST => RFDEST,
          RFSOURCE => RFSOURCE,
          WRENNEM => WRENNEM,
          RDENNEM => RDENNEM,
          weRF => weRF,
          PCSOURCE => PCSOURCE
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;	
		op3 <= "000100";
		wait for 20 ns;
		op3 <= "000101";
		wait for 20 ns;
		op3 <= "100110";
		wait for 20 ns;
		op3 <= "100111";

      -- insert stimulus here 

      wait;
   end process;

END;

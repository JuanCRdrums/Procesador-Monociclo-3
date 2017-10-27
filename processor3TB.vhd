
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY processor3TB IS
END processor3TB;
 
ARCHITECTURE behavior OF processor3TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor3
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor3 PORT MAP (
          clk => clk,
          rst => rst,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
		wait for 20 ns;
		rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;

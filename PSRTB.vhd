
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
--USE ieee.numeric_std.ALL;
 
ENTITY PSRTB IS
END PSRTB;
 
ARCHITECTURE behavior OF PSRTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
				nCWP: in std_logic_vector(4 downto 0);
				icc: out std_logic_vector(3 downto 0);
           C : out  STD_LOGIC;
			  CWP: out std_logic_vector(4 downto 0);
			  clk: in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
	signal nCWP: std_logic_vector(4 downto 0):= (others => '0');
	signal clk: std_logic := '0';

 	--Outputs
   signal C : std_logic;
	signal icc: std_logic_vector(3 downto 0);
	signal CWP: std_logic_vector(4 downto 0);
	
	

   -- Clock period definitions
   constant clk_period : time := 10 ns;


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          NZVC => NZVC,
          C => C,
			 nCWP => nCWP,
			 icc => icc,
			 clk => clk,
			 CWP => CWP
        );


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
      NZVC <= "1000";
		nCWP <= "00000";
		wait for 20 ns;
		NZVC <= "0011";
		nCWP <= "00001";

      -- insert stimulus here 

      wait;
   end process;

END;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity processor3 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end processor3;

architecture Behavioral of processor3 is

component ALU is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
				op1: in std_logic_vector(1 downto 0);
				c: in std_logic;
           d1 : in  STD_LOGIC_VECTOR (31 downto 0);
           d2 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ControlUnit is
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
end component;

component DataMemory is
    Port ( 
           reset : in  STD_LOGIC;
           WriteEnable : in  STD_LOGIC;
           enableMem : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
			  CRd : in  STD_LOGIC_VECTOR (31 downto 0);
           DataValue : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component PSRModifier is
    Port ( D1: in STD_LOGIC_VECTOR(31 downto 0);
				D2: in std_logic_vector(31 downto 0);
				ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  OP: in STD_LOGIC_VECTOR(1 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component PSR is 
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
				nCWP: in std_logic_vector(4 downto 0);
           C : out  STD_LOGIC;
			  CWP: out std_logic_vector(4 downto 0);
			  icc: out std_logic_vector(3 downto 0);
			  clk: in std_logic);
end component;

component RF is
    port (
          RD : in std_logic_vector(5 downto 0);
          DWR   : in std_logic_vector(31 downto 0);
			 RS1   : in std_logic_vector(5 downto 0);
			 RS2   : in std_logic_vector(5 downto 0);
          CRS1   : out std_logic_vector(31 downto 0);
			 CRS2   : out std_logic_vector(31 downto 0);
			 CRD: out std_logic_vector(31 downto 0);
			 rst: in std_logic;
			 we: in std_logic
			 );
end component;

component SEU22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           outSEU : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component SEU is
    Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           ncwp : out  STD_LOGIC_VECTOR (4 downto 0);
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
			  quince: out std_logic_vector(5 downto 0));
end component;





component multiplexDataMemory is
    Port ( RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
           DATATOMEM : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           outMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component multiplexPC is
    Port ( disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUR : in  STD_LOGIC_VECTOR (31 downto 0);
           pcSource : in  STD_LOGIC_VECTOR (1 downto 0);
           outMux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component multiplexRF is
    Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
			  quince: in std_logic_vector(5 downto 0);
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end component;


component muxALU is
    Port ( i : in  STD_LOGIC;
           R : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component sumador2 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           npc : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component sumador is
    Port ( dato1 : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pc is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (31 downto 0);
           outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component instructionMemory is
port (rst : in  STD_LOGIC;
      EN : in std_logic;
      ADDR : in std_logic_vector(31 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end component;


signal instruction: std_logic_vector(31 downto 0);
signal spc1: std_logic_vector(31 downto 0);
signal spc2: std_logic_vector(31 downto 0);
signal spc3: std_logic_vector(31 downto 0);
signal scwp: std_logic_vector(4 downto 0);
signal sncwp: std_logic_vector(4 downto 0);
signal snRs1: std_logic_vector(5 downto 0);
signal snRs2: std_logic_vector(5 downto 0);
signal snRd: std_logic_vector(5 downto 0);
signal squince: std_logic_vector(5 downto 0);
signal snRd2: std_logic_vector(5 downto 0);
signal imm13: std_logic_vector(12 downto 0);
signal imm32: std_logic_vector(31 downto 0);
signal sDWR: std_logic_vector(31 downto 0);
signal scRs1: std_logic_vector(31 downto 0);
signal scRs2: std_logic_vector(31 downto 0);
signal scRd: std_logic_vector(31 downto 0);
signal sweRF: std_logic;
signal sop2: std_logic_vector(31 downto 0);
signal sALUOP: std_logic_vector(5 downto 0);
signal sCarry: std_logic;
signal outputALU: std_logic_vector(31 downto 0);
signal sicc: std_logic_vector(3 downto 0);
signal sRFDEST: std_logic;
signal sRFSOURCE: std_logic_vector(1 downto 0);
signal sWRENNEM: std_logic;
signal sRDENNEM: std_logic;
signal sPCSOURCE: std_logic_vector(1 downto 0);
signal sDATATOMEM: std_logic_vector(31 downto 0);
signal sdisp2232: std_logic_vector(31 downto 0);
signal sdisp3032: std_logic_vector(31 downto 0);
signal sdisp22: std_logic_vector(21 downto 0);
signal sdisp30: std_logic_vector(29 downto 0);
signal spcmas: std_logic_vector(31 downto 0);
signal snpc: std_logic_vector(31 downto 0);
signal sdisp224: std_logic_vector(31 downto 0);
signal sdisp304: std_logic_vector(31 downto 0);
signal sNZVC: std_logic_vector(3 downto 0);


begin

nPc: pc
port map(
				rst => rst,
           clk => clk,
           datain => snpc,
           outp => spc2
);

cPc: pc
port map(
				rst => rst,
           clk => clk,
           datain => spc2,
           outp => spc3
);

s1: sumador
port map(
				dato1 => spc2,
           dato2 => "00000000000000000000000000000001",
           output => spcmas
);


IM: instructionMemory
port map(
		rst => rst,
      EN => '1',
      ADDR => spc3,
      DATA => instruction
);

wm: WindowsManager
port map(
			rs1 => instruction(18 downto 14),
           rs2 => instruction(4 downto 0),
           rd => instruction(29 downto 25),
           op => instruction(31 downto 30),
           op3 => instruction(24 downto 19),
           cwp => scwp,
           ncwp => sncwp,
           nRs1 => snRs1,
           nRs2 => snRs2,
           nRd => snRd,
			  quince => squince
);



muxRF: multiplexRF
port map(
				RD => snRd,
				RFDEST => sRFDEST,
			  quince => squince,
           nRD => snRd2
);


SEU13: SEU
port map(
	imm => instruction(12 downto 0),
   output => imm32
);


RegisterFile: RF
port map(
			RD => snRd2,
          DWR => sDWR,
			 RS1  => snRs1,
			 RS2  => snRs2,
          CRS1  => scRs1,
			 CRS2  => scRs2,
			 CRD => scRd,
			 rst => rst,
			 we => sweRF
);

multiplexALU: muxALU
port map(
				i => instruction(13),
           R => scRs2,
           imm => imm32,
           output => sop2
);

 IALU: ALU
 port map(
				op => sALUOP,
				op1 => instruction(31 downto 30),
				c => sCarry,
           d1 => scRs1,
           d2 => sop2,
           output => outputALU
 );
 
 PSRM: PSRModifier
 port map(
				D1 => sCrs1,
				D2 => sop2,
				ALUR => outputALU,
           OP3 => instruction(24 downto 19),
			  OP => instruction(31 downto 30),
           NZVC => sNZVC
 );
 
 IPSR: PSR
 port map(
				NZVC => sNZVC,
				icc => sicc,
				nCWP => sncwp,
           C => sCarry,
			  CWP => scwp,
			  clk => clk
 );
 
 
CU: ControlUnit
port map(
				op => instruction(31 downto 30),
				op2 => instruction(24 downto 22),
				icc => sicc,
           op3 => instruction(24 downto 19),
           aluop => sALUOP,
			  cond => instruction(28 downto 25),
			  RFDEST => sRFDEST,
			  RFSOURCE => sRFSOURCE,
			  WRENNEM => sWRENNEM,
			  RDENNEM => sRDENNEM,
			  weRF => sweRF,
			  PCSOURCE => sPCSOURCE
);


DM: DataMemory
port map(
	        reset => rst,
           WriteEnable => sWRENNEM,
           enableMem => sRDENNEM,
           Address => outputALU,
			  CRd => scRd,
           DataValue => sDATATOMEM
);

muxDM: multiplexDataMemory
port map(
				RFSource => sRFSOURCE,
           DATATOMEM => sDATATOMEM,
           ALUR => outputALU,
           pc => spc3,
           outMUX => sDWR
);


muxPC: multiplexPC
port map(
			disp22 => sdisp224,
           disp30 => sdisp304,
           pc => spcmas,
           ALUR => outputALU,
           pcSource => sPCSOURCE,
           outMux => snpc
);


ISEU22: SEU22
port map(
				disp22 => instruction(21 downto 0),
           outSEU => sdisp2232
);




s2: sumador
port map(
				dato1 => spc3,
           dato2 => sdisp2232,
           output => sdisp224
);

s3: sumador2
port map(
				disp30 => instruction(29 downto 0),
           npc => spc3,
           output => sdisp304
);

output <= sDWR;

end Behavioral;


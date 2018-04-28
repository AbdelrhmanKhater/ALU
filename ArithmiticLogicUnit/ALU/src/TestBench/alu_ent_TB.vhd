library ALU;
use ALU.mypackage.all;
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

	-- Add your library and packages declaration here ...

entity alu_ent_tb is
end alu_ent_tb;

architecture TB_ARCHITECTURE of alu_ent_tb is
	-- Component declaration of the tested unit
	component alu_ent
	port(
		a : in STD_LOGIC_VECTOR(7 downto 0);
		b : in STD_LOGIC_VECTOR(7 downto 0);
		sel : in ops;
		z : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(7 downto 0);
	signal b : STD_LOGIC_VECTOR(7 downto 0);
	signal sel : ops;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal z : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu_ent
		port map (
			a => a,
			b => b,
			sel => sel,
			z => z
		);

	-- Add your stimulus here ...
	process
	begin
		sel <= ADD;
		a <= "00000100";
		b <= "00000010";  
		wait for 100ns;
		sel <= SUB;
		a <= "00000100";
		b <= "00000010";  
		wait for 100ns;
		sel <= INC;
		a <= "00000100";
		b <= "00000010";  
		wait for 100ns;
		end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu_ent of alu_ent_tb is
	for TB_ARCHITECTURE
		for UUT : alu_ent
			use entity work.alu_ent(alu_arch);
		end for;
	end for;
end TESTBENCH_FOR_alu_ent;


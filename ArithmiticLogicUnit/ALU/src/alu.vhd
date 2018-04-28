-------------------------------------------------------------------------------
--
-- Title       : alu_ent
-- Design      : ALU
-- Author      : khater
-- Company     : TFE
--
-------------------------------------------------------------------------------
--
-- File        : alu.vhd
-- Generated   : Sat Apr 28 00:35:16 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {alu_ent} architecture {alu_arch}}
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
USE ieee.numeric_std.ALL;
use work.mypackage.all;
entity alu_ent is
	 port(
		 a : in std_logic_vector(7 downto 0);
		 b : in std_logic_vector(7 downto 0);
		 sel : in ops;
		 z : out std_logic_vector(7 downto 0)
	     );
end alu_ent;

--}} End of automatically maintained section

architecture alu_arch of alu_ent is	
signal tmp1:bit_vector(7 downto 0);
signal tmp2:integer;
signal res:bit_vector(7 downto 0);
begin

	-- enter your statements here --	   
	process(sel, a, b)
	begin 
	 	case sel is
					when NOP =>
						z <= a;
					when SHL =>				
					tmp1 <= to_bitvector(a);
					tmp2 <= to_integer(signed(b));
					res <= tmp1 sll tmp2;
					z <= to_StdLogicVector(res);
					when SHR =>
					tmp1 <= to_bitvector(a);
					tmp2 <= to_integer(signed(b));
					res <= tmp1 srl tmp2;
					z <= to_StdLogicVector(res);
					when ROL_O =>
					tmp1 <= to_bitvector(a);
					tmp2 <= to_integer(signed(b));			
					res <= tmp1 rol tmp2;
					z <= to_StdLogicVector(res);
					when ROR_O =>
					tmp1 <= to_bitvector(a);
					tmp2 <= to_integer(signed(b));
					res <= tmp1 ror tmp2;
					z <= to_StdLogicVector(res);
					when ADD =>
						z <= a + b;
					when SUB=>
						z <= a - b;
					when INC =>
						z <= a + "00000001";
					when DEC =>
						z <= a - "00000001";
					when ZERO =>
						z <= "00000000";
		 end case;
		end process;
end alu_arch;

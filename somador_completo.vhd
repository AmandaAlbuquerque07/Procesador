----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Amanda e Leticia
-- 
-- Create Date:    14:36:46 04/22/2026 
-- Design Name: 
-- Module Name:    somador_completo - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_completo is
	port (
		A, B, VEM1 : in std_logic;
		VAI1, SOMA : out std_logic
	);
end somador_completo;

architecture Behavioral of somador_completo is

begin
	VAI1 <= (B and VEM1) or (A and VEM1) or (A and B);
	SOMA <= (not A and not B and VEM1) or (not A and B and not VEM1) or (A and B and VEM1) or (A and not B and not VEM1);
end Behavioral;


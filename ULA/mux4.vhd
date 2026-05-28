----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:28 05/06/2026 
-- Design Name: 
-- Module Name:    mux4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
	port(
		E : in std_logic_vector(0 to 3);
		Sel : in std_logic_vector(1 downto 0);
		Saida : out std_logic
	);
end mux4;

architecture Behavioral of mux4 is
	component mux2 is
		port(
			E : in std_logic_vector(0 to 1);
			Sel : in std_logic;
			Saida : out std_logic
		);
	end component;
	
	signal m1param3, m2param3 : std_logic;
begin
	M1 : mux2 port map (
		E => E(0 to 1),
		Sel => Sel(0),
		Saida => m1param3
	);

	M2 : mux2 port map (
		E => E(2 to 3),
		Sel => Sel(0),
		Saida => m2param3
	);

	M3 : mux2 port map (
		E(0) => m1param3,
		E(1) => m2param3,
		Sel => Sel(1),
		Saida => Saida
	);

end Behavioral;


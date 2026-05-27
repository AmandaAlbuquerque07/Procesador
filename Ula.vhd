----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:28 05/06/2026 
-- Design Name: 
-- Module Name:    ULA - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ULA is
	port(
		A, B, Ai, Bi, Cin, Less : in std_logic;
		Op : in std_logic_vector(1 downto 0);
		Result, Set, Cout : out std_logic
	);
end ULA;

architecture Behavioral of mux4 is
	component mux2 is
		port(
			E : in std_logic_vector(0 to 1);
			Sel : in std_logic;
			Saida : out std_logic
		);
	end component;
	
	component mux4 is
		port(
			E : in std_logic_vector(0 to 3);
			Sel : in std_logic_vector(1 downto 0);
			Saida : out std_logic
		);
	end component;
	
	component somador_completo is
		port (
			a, b, VEM1 : in std_logic;
			VAI1, SOMA : out std_logic
		);
	end component;

	
	signal SaidaMux1, SaidaMux2, SaidaSomador, SaidaAnd, SaidaOr: std_logic;
	signal NaoA, NaoB : std_logic;
	
begin
	NaoA <= not A;
	NaoB <= not B;
	
	Muxinho1 : mux2 port map (
		E => A,
		Sel => Ai,
		Saida => SaidaMux1
	);

	Muxinho2 : mux2 port map (
		E => B,
		Sel => Bi,
		Saida => SaidaMux2
	);
	
	Somador : somador_completo port map (
		a => SaidaMux1, 
		b => SaidaMux2,
		VEM1	=> Cin,		
		VAI1 => Cout,
		SOMA => SaidaSomador
	);
	
	Muxao : mux4 port map (
		E(0) => SaidaAnd,
		E(1) => SaidaOr,
		E(2) => SaidaSomador,
		E(3) => Less,
		Sel(0) => Op(0),
		Sel(1) => Op(1),
		Saida => Result
	);
	
	SaidaAnd <= SaidaMux1 and SaidaMux2;
	SaidaOr <= SaidaMux1 or SaidaMux2;
	
	Set <= SaidaSomador;

end Behavioral;


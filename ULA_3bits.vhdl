library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ula_1Bit is
port (
	Vem_Um : in STD_LOGIC;
	A : in STD_LOGIC;
	B : in STD_LOGIC;
	S : in STD_LOGIC_VECTOR (2 downto 0);
	Vai_Um : out STD_LOGIC;
	F : out STD_LOGIC

       );
end Ula_1Bit;

architecture Comportamental_1 of Ula_1Bit is

signal A1 : STD_LOGIC;
signal A2 : STD_LOGIC;
signal A3 : STD_LOGIC;
signal A4 : STD_LOGIC;
signal X1 : STD_LOGIC;
signal X2 : STD_LOGIC;
	begin
		A1 <= S(1) and B;
		X1 <= S(0) xor A;
		A2 <= S(2) and Vem_Um;
		X2 <= X1 xor A2;
		A3 <= X1 and A2;
		A4 <= A1 and X2;
		F <= A1 xor X2;
		Vai_Um <= A3 or A4;
end Comportamental_1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_3bits is
generic (k: integer:= 3 );
port (
	--Vem_Um : in STD_LOGIC;
	--A, B, S : in STD_LOGIC_VECTOR (2 downto 0);
	--Vai_Um : out STD_LOGIC;
	--F : out STD_LOGIC_VECTOR (2 downto 0)
	SW: in std_logic_vector(9 downto 0);
	LEDG: out std_logic_vector(8 downto 0);
	LEDR: out std_logic_vector (8 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0)
       );
end ULA_3bits;

architecture Comportamental_2 of ULA_3bits is
	signal Vai_Um: std_logic;
	signal Vem_Um: std_logic;
	signal resultado: std_logic_vector(k downto 0);
	signal A: std_logic_vector(k-1 downto 0);
	signal B: std_logic_vector(k-1 downto 0);
	signal S: std_logic_vector(k-1 downto 0);
	signal D: std_logic_vector(1 downto 0);
  signal F :STD_LOGIC_VECTOR (2 downto 0)
component Ula_1Bit
	port
	(
		Vem_Um, A, B : in STD_LOGIC;
		S : in STD_LOGIC_VECTOR (2 downto 0);
		Vai_Um, F : out STD_LOGIC
	);
end component;
begin
	Vem_Um <= SW(9);
	S <= SW(2 downto 0);
	A <= SW(5 downto 3);
  B <= SW(8 downto 6);
	LEDR(2 downto 0) <= S(2 downto 0);
	LEDR(5 downto 3) <=A;
	LEDR(8 downto 6) <=B;
	Bit0: Ula_1Bit
		port map (Vem_Um, A(0), B(0), S, D(0), F(0));
	Bit1: Ula_1Bit
		port map (D(0), A(1), B(1), S, D(1), F(1));
	Bit2: Ula_1Bit
		port map (D(1), A(2), B(2), S, Vai_Um, F(2));

	LEDG(8) <= Vai_Um;
	resultado <= ('0' & F(2 downto 0)) + Vai_Um;
	--pra mim tem que ser assim:
	--resultado <= F(2 downto 0);
	--resultado(3) <= Vai_Um;
	LEDG(3 downto 0) <= resultado;

  with A select
		HEX3(6 downto 0) <=
         "1000000" when "000",  --0
         "1111001" when "001",  --1
         "0100100" when "010",  --2
         "0110000" when "011",  --3
         "0011001" when "100",  --4
         "0010010" when "101",  --5
         "0000010" when "110",  --6
         "1011000" when others; --7
 with B select
		HEX2(6 downto 0) <=
         "1000000" when "000",  --0
         "1111001" when "001",  --1
         "0100100" when "010",  --2
         "0110000" when "011",  --3
         "0011001" when "100",  --4
         "0010010" when "101",  --5
         "0000010" when "110",  --6
         "1011000" when others; --7
	with resultado select
		HEX0(6 downto 0) <=
				"1000000" when "0000" , --0
				"1111001" when "0001" , --1
				"0100100" when "0010" , --2
				"0110000" when "0011" , --3
				"0011001" when "0100" , --4
				"0010010" when "0101" , --5
				"0000010" when "0110" , --6
				"1011000" when "0111", --7
				"0000000" when "1000", --8
				"0010000" when "1001", --9
				"1000000" when "1010", --0
				"1111001" when "1011", --1
				"0100100" when "1100", --2
				"0110000" when "1101", --3
				"0011001" when "1110", --4
				"0010010" when others; --5
		with resultado select
			HEX1(6 downto 0) <=
				"1111001" when "1010", --1
				"1111001" when "1011",
				"1111001" when "1100",
				"1111001" when "1101",
				"1111001" when "1110",
				"1111001" when "1111",
				"1000000" when others; --0


end Comportamental_2;

--entity ULA_Completa is
--  generic (k: integer:= 3 );
--  port (
--        -- vem_um: in std_logic;
--        -- X, Y: in std_logic_vector(k-1 downto 0);
--		  SW: in std_logic_vector(9 downto 0);
--		  --LEDG: out std_logic_vector(k-1 downto 0);
--		  --LEDR: out std_logic_vector (0 downto 0);
--		  HEX0: out std_logic_vector(6 downto 0);
--		  HEX1: out std_logic_vector(6 downto 0);
--		  HEX2: out std_logic_vector(6 downto 0);
--		  HEX3: out std_logic_vector(6 downto 0)
--		  );
--end ULA_Completa;
--
--architecture Comportamental of ULA_Completa is
--  signal soma: std_logic_vector(k downto 0);
--  signal Y: std_logic_vector(k-1 downto 0);
--  signal X: std_logic_vector(k-1 downto 0);
--  signal vem_um: std_logic;
--  signal vai_um: std_logic;
--  signal S: std_logic_vector(k-1 downto 0);
--begin
--  vem_um <= SW(9);
--  X <= SW(k-1 downto 0);
--  Y <= SW((k*2)-1 downto k);
--  soma <= ('0' & X) + ('0' & Y) + vem_um;
--  S <= soma(k-1 downto 0);
--  vai_um <= soma(k);
--  --LEDG <= soma (k-1 downto 0);
--  --LEDR(0) <= vai_um;
--  with Y select
--		HEX3(6 downto 0) <=
--         "1000000" when "000", --0
--         "1111001" when "001", --1
--         "0100100" when "010", --2
--         "0110000" when "011", --3
--         "0011001" when "100", --4
--         "0010010" when "101", --5
--         "0000010" when "110", --6
--         "1011000" when others; --7
-- with X select
--		HEX2(6 downto 0) <=
--         "1000000" when "000",
--         "1111001" when "001",
--         "0100100" when "010",
--         "0110000" when "011",
--         "0011001" when "100",
--         "0010010" when "101",
--         "0000010" when "110",
--         "1011000" when others;
--	with resultado select
--		HEX0(6 downto 0) <=
--				"1000000" when "0000" , --0
--				"1111001" when "0001" , --1
--				"0100100" when "0010" , --2
--				"0110000" when "0011" , --3
--				"0011001" when "0100" , --4
--				"0010010" when "0101" , --5
--				"0000010" when "0110" , --6
--				"1011000" when "0111", --7
--				"0000000" when "1000", --8
--				"0010000" when "1001", --9
--				"1000000" when "1010", --0
--				"1111001" when "1011", --1
--				"0100100" when "1100", --2
--				"0110000" when "1101", --3
--				"0011001" when "1110", --4
--				"0010010" when others; --5
--		with resultado select
--			HEX1(6 downto 0) <=
--				"1111001" when "1010", --1
--				"1111001" when "1011",
--				"1111001" when "1100",
--				"1111001" when "1101",
--				"1111001" when "1110",
--				"1111001" when "1111",
--				"1000000" when others; --0
--
--
--end Comportamental;
--

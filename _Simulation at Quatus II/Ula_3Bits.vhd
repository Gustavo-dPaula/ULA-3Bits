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

entity Ula_3Bits is 
port ( 
	Vem_Um : in STD_LOGIC;
	A, B, S : in STD_LOGIC_VECTOR (2 downto 0);
	Vai_Um : out STD_LOGIC; 
	F : out STD_LOGIC_VECTOR (2 downto 0)
       ); 
end Ula_3Bits; 

architecture Comportamental_2 of Ula_3Bits is
component Ula_1Bit
	port
	(
		Vem_Um, A, B : in STD_LOGIC;
		S : in STD_LOGIC_VECTOR (2 downto 0);
		Vai_Um, F : out STD_LOGIC
	);
end component;
signal D: std_logic_vector(1 downto 0);
begin
	Bit0: Ula_1Bit
	port map (Vem_Um, A(0), B(0), S, D(0), F(0));
	Bit1: Ula_1Bit
	port map (D(0), A(1), B(1), S, D(1), F(1));
	Bit2: Ula_1Bit
	port map (D(1), A(2), B(2), S, Vai_Um, F(2));	
end Comportamental_2; 

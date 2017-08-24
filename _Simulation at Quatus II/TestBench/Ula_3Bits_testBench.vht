-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "08/02/2017 13:16:33"
                                                            
-- Vhdl Test Bench template for design  :  Ula_3Bits
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Ula_3Bits_vhd_tst IS
END Ula_3Bits_vhd_tst;
ARCHITECTURE Ula_3Bits_arch OF Ula_3Bits_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL F : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Vai_Um : STD_LOGIC;
SIGNAL Vem_Um : STD_LOGIC;
COMPONENT Ula_3Bits
	PORT (
	A : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	F : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Vai_Um : OUT STD_LOGIC;
	Vem_Um : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Ula_3Bits
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	F => F,
	S => S,
	Vai_Um => Vai_Um,
	Vem_Um => Vem_Um
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
 -- soma completa A + B (S = 110)
   -- vetor de teste 1
   Vem_Um <= '0';
   A <= "010";
   B <= "000";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 2
	Vem_Um <= '0';
  	A <= "010";
	B <= "001";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 3
	Vem_Um <= '0';
	A <= "011";
	B <= "001";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 4
	Vem_Um <= '0';
	A <= "101";
	B <= "011";
	S <= "110";
	wait for 200 ns;
	
    -- vetor de teste 5
   Vem_Um <= '1';
   A <= "010";
   B <= "000";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 6
	Vem_Um <= '1';
  	A <= "010";
	B <= "001";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 7
	Vem_Um <= '1';
	A <= "011";
	B <= "001";
	S <= "110";
	wait for 200 ns;

    -- vetor de teste 8
	Vem_Um <= '1';
	A <= "101";
	B <= "011";
	S <= "110";
	wait for 200 ns;
	
--............................................................................

--subtracao complemento de 2 B - A(S=111, vem_um = 1)
   -- vetor de teste 1
   Vem_Um <= '1';
   A <= "010";
   B <= "000";
	S <= "111";
	wait for 200 ns;

    -- vetor de teste 2
	Vem_Um <= '1';
  	A <= "010";
	B <= "001";
	S <= "111";
	wait for 200 ns;

    -- vetor de teste 3
	Vem_Um <= '1';
	A <= "011";
	B <= "001";
	S <= "111";
	wait for 200 ns;

    -- vetor de teste 4
	Vem_Um <= '1';
	A <= "101";
	B <= "011";
	S <= "111";
	wait for 200 ns;
	
--...........................................................................

--operacao logica A xor B (S = 010)
   -- vetor de teste 1
   Vem_Um <= '0';
   A <= "010";
   B <= "000";
	S <= "010";
	wait for 200 ns;

    -- vetor de teste 2
	Vem_Um <= '0';
  	A <= "010";
	B <= "001";
	S <= "010";
	wait for 200 ns;

    -- vetor de teste 3
	Vem_Um <= '1';
	A <= "011";
	B <= "001";
	S <= "010";
	wait for 200 ns;

    -- vetor de teste 4
	Vem_Um <= '1';
	A <= "101";
	B <= "011";
	S <= "010";
	wait for 200 ns;
	
--...........................................................................

--operacao logica not A (S = 001)
   -- vetor de teste 1
   Vem_Um <= '0';
   A <= "010";
   B <= "000";
	S <= "001";
	wait for 200 ns;

    -- vetor de teste 2
	Vem_Um <= '0';
  	A <= "010";
	B <= "001";
	S <= "001";
	wait for 200 ns;

    -- vetor de teste 3
	Vem_Um <= '1';
	A <= "011";
	B <= "001";
	S <= "001";
	wait for 200 ns;

    -- vetor de teste 4
	Vem_Um <= '1';
	A <= "101";
	B <= "011";
	S <= "001";
	wait for 200 ns;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Ula_3Bits_arch;

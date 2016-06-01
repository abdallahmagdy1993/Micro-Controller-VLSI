library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;


Entity pwm is
	port( 
	data_bus : inout std_logic_vector(7 downto 0);
	clk, rd_wr, en, a0, rst, add_en : in std_logic;
	pwm_out : out std_logic
	);
end pwm;

Architecture struct of  pwm is
	
	Component my_nDFF is
		Generic ( n : integer := 8);
		port( clk,rst,e : in std_logic;
		d : in std_logic_vector(n-1 downto 0);
		q : out std_logic_vector(n-1 downto 0));
	end Component;
	
	component tri_state_buffer is
		Generic ( n : integer := 8);
		Port ( EN   : in  STD_LOGIC;    -- single buffer enable
           Input  : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Output : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component my_DFF is
		port( d,clk,rst,e : in std_logic;
		q : out std_logic);
	end component;
	
	signal res,counter_data,counter,counter_in : std_logic_vector(7 downto 0); 
	signal duty: std_logic_vector(7 downto 0); 
	signal res_reg_en : std_logic; 
	signal res_tri_en : std_logic;
	signal duty_reg_en : std_logic;
	signal duty_tri_en : std_logic;
	signal used_clk : std_logic;
	signal counter_rst : std_logic;
begin
	res_reg_en <=(not a0) and add_en and (rd_wr);
	res_tri_en <= (not a0) and add_en and ( not rd_wr);
	duty_reg_en <= (a0) and add_en and (rd_wr);
	duty_tri_en <= (a0) and add_en and ( not rd_wr);
	---- address 0x48 : resolution register ----
	res_reg : my_nDFF port map(clk,rst,res_reg_en,data_bus,res);
	res_tri : tri_state_buffer port map(res_tri_en,res,data_bus);
	---- ---- address 0x49 : duty register ----
	duty_reg : my_nDFF port map(clk,rst,duty_reg_en,data_bus,duty);
	duty_tri : tri_state_buffer port map(duty_tri_en,duty,data_bus);
	----
	used_clk <= clk and en;
	
	count_reg : my_nDFF port map(used_clk,counter_rst,'1',counter_in,counter);
	
	
	pwm_out <= '1' when(counter < duty and counter_rst = '0')
	else '0' when(counter < res and counter_rst = '0')
	else '0' when counter_rst='1';
	
	counter_rst<= '1' when rst='1' or res_reg_en='1' or duty_reg_en='1'
	else '0';
	

	counter_in <= "00000000" when counter=res-1
	else counter+1;
	
end struct;




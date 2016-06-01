library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;


Entity timer0 is
	port( 
	data_bus : inout std_logic_vector(7 downto 0);
	clk, rd_wr, ext_clk, en, a0, rst, add_en : in std_logic;
	int0 : out std_logic
	);
end timer0;

Architecture struct of  timer0 is
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
	
	
	signal c_word : std_logic_vector(7 downto 0);
	signal counter: std_logic_vector(7 downto 0); 
	signal data : std_logic_vector(7 downto 0);
	signal cnt_reg_en : std_logic; 
	signal cnt_tri_en : std_logic;
	signal data_reg_en : std_logic;
	signal data_tri_en : std_logic;
	signal midd_clk, midd_clk2, midd_clk3, midd_clk4,used_clk : std_logic;
	signal final_clk,counter_rst : std_logic;
begin
	cnt_reg_en <=(not a0) and add_en and (rd_wr);
	cnt_tri_en <= (not a0) and add_en and ( not rd_wr);
	data_reg_en <= (a0) and add_en and (rd_wr);
	data_tri_en <= (a0) and add_en and ( not rd_wr);
	---- address 0x40 : control word register ----
	cnt_reg : my_nDFF port map(clk,rst,cnt_reg_en,data_bus,c_word);
	cnt_tri : tri_state_buffer port map(cnt_tri_en,c_word,data_bus);
	----
	data_reg : my_nDFF port map(clk,rst,data_reg_en,data_bus,data);
	data_tri : tri_state_buffer port map(data_tri_en,counter,data_bus);
	----
	used_clk <= clk and en;
	midd_clk <= clk when c_word(1) = '0' 
	else ext_clk when c_word(1) = '1';
	----
	sync_reg : my_DFF port map(midd_clk,clk,rst,'1',midd_clk2);
	----
	midd_clk3 <= midd_clk when c_word(2) = '0'
	else midd_clk2 when c_word(2) = '1';
	-----
	midd_clk4 <= midd_clk3 xor c_word(0);
	-----
	final_clk <= midd_clk4 and en and (not rst);
	

	counter_rst <= '1' when data_reg_en = '1' or cnt_reg_en = '1' or rst='1'
	else '0';

	int0 <= '1' when counter = "00000000" and counter_rst='0'
	else '0' when counter_rst = '1'
	else '0';
	

	process(rst,final_clk,counter,data,data_bus,data_reg_en,cnt_reg_en)
		begin
			if rst='1' then
				counter<="00000000";
			elsif data_reg_en = '1' then
				counter <= data_bus;
			elsif cnt_reg_en = '1' then
				counter <= data;
			elsif(rising_edge(final_clk)) then
				counter<=counter+1;
			end if;
	end process;
end struct;


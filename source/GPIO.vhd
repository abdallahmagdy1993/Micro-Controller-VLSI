Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity GPIO is
	port( 
	data_bus,pins : inout std_logic_vector(7 downto 0);
	clk, rd_wr, en, a1,a0, rst, add_en,int0,int1,pwm : in std_logic
	);
end GPIO;

Architecture struct of  GPIO is
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
	
	signal c_word,c_word2 : std_logic_vector(7 downto 0);
	signal data : std_logic_vector(7 downto 0);
	signal cnt_reg_en,used_clk : std_logic; 
	signal cnt_tri_en : std_logic;
	signal cnt2_reg_en : std_logic; 
	signal cnt2_tri_en : std_logic;	
	signal data_reg_en : std_logic;
	signal data_tri_en : std_logic;
	signal temp_data,temp_pins : std_logic_vector(7 downto 0);
begin
	used_clk <= clk and en;
	cnt_reg_en <=(not a0) and (not a1) and add_en and (rd_wr);
	cnt_tri_en <= (not a0) and (not a1) and add_en and ( not rd_wr);
	cnt2_reg_en <= a0 and (not a1) and add_en and (rd_wr);
	cnt2_tri_en <= a0 and (not a1) and add_en and ( not rd_wr);
	data_reg_en <= (not a0) and a1 and add_en and (rd_wr) ;
	data_tri_en <= (not a0) and a1 and add_en and ( not rd_wr);
	---- address 0x64 : control word register ----
	cnt_reg : my_nDFF port map(used_clk,rst,cnt_reg_en,data_bus,c_word);
	cnt_tri : tri_state_buffer port map(cnt_tri_en,c_word,data_bus);
	---- address 0x65 : control word register ----
	cnt_reg2 : my_nDFF port map(used_clk,rst,cnt2_reg_en,data_bus,c_word2);
	cnt_tri2 : tri_state_buffer port map(cnt2_tri_en,c_word2,data_bus);
	----
	data_tri : tri_state_buffer port map(data_tri_en,data,data_bus);
	
	data(0) <= '0' when rst = '1'
	else data_bus(0) when c_word(0)='0' and c_word2(0)='0' and data_reg_en='1'
	else int0 when c_word(0)='0' and c_word2(0)='1'
	else pins(0) when c_word(0)='1'
	else '1' xnor data(0);
	
	data(1) <= '0' when rst = '1'
	else data_bus(1) when c_word(1)='0' and c_word2(1)='0'  and data_reg_en='1'
	else int1 when c_word(1)='0' and c_word2(1)='1'
	else pins(1) when c_word(1)='1'
	else '1' xnor data(1);
	
	data(2) <= '0' when rst = '1'
	else data_bus(2) when c_word(2)='0' and c_word2(2)='0'  and data_reg_en='1'
	else pwm when c_word(2)='0' and c_word2(2)='1'
	else pins(2) when c_word(2)='1'
	else '1' xnor data(2);
	
	data(3) <= '0' when rst = '1'
	else data_bus(3) when c_word(3)='0' and c_word2(3)='0'  and data_reg_en='1'
	else pins(3) when c_word(3)='1'
	else '1' xnor data(3);
	
	data(4) <= '0' when rst = '1'
	else data_bus(4) when c_word(4)='0' and c_word2(4)='0'  and data_reg_en='1'
	else pins(4) when c_word(4)='1'
	else '1' xnor data(4);
	
	data(5) <= '0' when rst = '1'
	else data_bus(5) when c_word(5)='0' and c_word2(5)='0'  and data_reg_en='1'
	else pins(5) when c_word(5)='1'
	else '1' xnor data(5);
	
	data(6) <= '0' when rst = '1'
	else data_bus(6) when c_word(6)='0' and c_word2(6)='0'  and data_reg_en='1'
	else pins(6) when c_word(6)='1'
	else '1' xnor data(6);
	
	data(7) <= '0' when rst = '1'
	else data_bus(7) when c_word(7)='0' and c_word2(7)='0'  and data_reg_en='1'
	else pins(7) when c_word(7)='1'
	else '1' xnor data(7);
	
	pins(0) <= data(0) when c_word(0) = '0'
	else '1' xnor pins(0);
	
	pins(1) <= data(1) when c_word(1) = '0'
	else '1' xnor pins(1);
	
	pins(2) <= data(2) when c_word(2) = '0'
	else '1' xnor pins(2);
	
	pins(3) <= data(3) when c_word(3) = '0'
	else '1' xnor pins(3);
	
	pins(4) <= data(4) when c_word(4) = '0'
	else '1' xnor pins(4);
	
	pins(5) <= data(5) when c_word(5) = '0'
	else '1' xnor pins(5);
	
	pins(6) <= data(6) when c_word(6) = '0'
	else '1' xnor pins(6);
	
	pins(7) <= data(7) when c_word(7) = '0'
	else '1' xnor pins(7);
end struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;


Entity timer1 is
	port( 
	data_bus : inout std_logic_vector(7 downto 0);
	clk, rd_wr, en, a0, rst, add_en : in std_logic;
	int1 : out std_logic
	);
end timer1;

Architecture struct of  timer1 is
	
	 component prescaler is
	  port( clk,rst :in std_logic;
			in_pre:in std_logic_vector(7 downto 0);
			out_clk:out std_logic
			);
	end component;
	
	component postscaler is
		port( clk,rst,In_intr :in std_logic;
        in_post:in std_logic_vector(7 downto 0);
        out_intr:out std_logic
        );
	end component;

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
	signal counter_in,counter: std_logic_vector(7 downto 0); 
	signal data : std_logic_vector(7 downto 0);
	signal cnt_reg_en : std_logic; 
	signal cnt_tri_en : std_logic;
	signal data_reg_en : std_logic;
	signal data_tri_en : std_logic;
	signal used_clk,pre_clk,one_clk,overflow : std_logic;
	signal prescale,postscale : std_logic_vector(7 downto 0);
	signal used_rst : std_logic; 
	
begin
	cnt_reg_en <=(not a0) and add_en and (rd_wr) and (not rst);
	cnt_tri_en <= (not a0) and add_en and ( not rd_wr);
	data_reg_en <= (a0) and add_en and (rd_wr) and (not rst);
	data_tri_en <= (a0) and add_en and ( not rd_wr);
	---- address 0x44 : control word register ----
	cnt_reg : my_nDFF port map(clk,rst,cnt_reg_en,data_bus,c_word);
	cnt_tri : tri_state_buffer port map(cnt_tri_en,c_word,data_bus);
	----
	data_reg : my_nDFF port map(clk,rst,data_reg_en,data_bus,data);
	data_tri : tri_state_buffer port map(data_tri_en,counter,data_bus);
	----
	prescale <= "00000001" when c_word(2 downto 0) = "001"
	else "00000010" when c_word(2 downto 0) = "010"
	else "00000100" when c_word(2 downto 0) = "011"
	else "00001000" when c_word(2 downto 0) = "100"
	else "00000001";
	
	
	postscale <= "00000001" when c_word(4 downto 3) = "00"
	else "00000010" when c_word(4 downto 3) = "01"
	else "00000100" when c_word(4 downto 3) = "10"
	else "00001000" when c_word(4 downto 3) = "11";
	
	used_clk <= clk and en;
	one_clk <= used_clk when c_word(2 downto 0) = "000"
	else pre_clk;
	
	used_rst <= rst or data_reg_en or cnt_reg_en;

	pre_scaler : prescaler port map(used_clk,used_rst,prescale,pre_clk);
	post_scaler : postscaler port map(used_clk,used_rst,overflow,postscale,int1);
	
	count_reg : my_nDFF port map(one_clk,used_rst,'1',counter_in,counter);

	
	
	counter_in <= "00000001" when counter=data
	else counter+1;

	overflow <='1' when counter = data and used_rst='0'
	else '0' when used_rst='1'
	else '0';
	

end struct;





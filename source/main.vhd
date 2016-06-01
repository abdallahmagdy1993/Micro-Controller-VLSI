Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity main is
	port( 
	data_bus,pins : inout std_logic_vector(7 downto 0);
	add_bus : in std_logic_vector(7 downto 0);
	clk, rd_wr, en, rst,ext_clk: in std_logic;
	Global_INT : out std_logic
	);
end main;


Architecture struct of  main is
	
	component pwm is
		port( 
		data_bus : inout std_logic_vector(7 downto 0);
		clk, rd_wr, en, a0, rst, add_en : in std_logic;
		pwm_out : out std_logic
		);
	end component;
	
	component timer0 is
		port( 
		data_bus : inout std_logic_vector(7 downto 0);
		clk, rd_wr, ext_clk, en, a0, rst, add_en : in std_logic;
		int0 : out std_logic
		);
	end component;
	
	component timer1 is
		port( 
		data_bus : inout std_logic_vector(7 downto 0);
		clk, rd_wr, en, a0, rst, add_en : in std_logic;
		int1 : out std_logic
		);
	end component;

	component GPIO is
		port( 
		data_bus,pins : inout std_logic_vector(7 downto 0);
		clk, rd_wr, en, a1,a0, rst, add_en,int0,int1,pwm : in std_logic
		);
	end component;


	component my_nDFF is
		Generic ( n : integer := 8);
		port( clk,rst,e : in std_logic;
		d : in std_logic_vector(n-1 downto 0);
		q : out std_logic_vector(n-1 downto 0));
	end component;
	
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
	
	signal timer0_add_en,timer1_add_en,pwm_add_en,GPIO_add_en,int_reg_en,int_tri_en : std_logic;
	signal int0,int1,pwm_out : std_logic;
	signal tmp_int0,tmp_int1 : std_logic;
	signal int_en_reg : std_logic_vector(7 downto 0);
begin
	timer0_add_en <= (not add_bus(7)) and add_bus(6) and (not add_bus(5)) and (not add_bus(4)) and (not add_bus(3)) and (not add_bus(2)) and (not add_bus(1));
	timer1_add_en <= (not add_bus(7)) and add_bus(6) and (not add_bus(5)) and (not add_bus(4)) and (not add_bus(3)) and (add_bus(2)) and (not add_bus(1));
	pwm_add_en <= (not add_bus(7)) and add_bus(6) and (not add_bus(5)) and (not add_bus(4)) and (add_bus(3)) and (not add_bus(2)) and (not add_bus(1));
	GPIO_add_en <= (not add_bus(7)) and add_bus(6) and (add_bus(5)) and (not add_bus(4)) and (not add_bus(3)) and (add_bus(2));
	int_reg_en <= (not add_bus(7)) and (not add_bus(6)) and (add_bus(5)) and (add_bus(4)) and (not add_bus(3)) and (not add_bus(2)) and (not add_bus(1)) and (not add_bus(0)) and rd_wr;
	int_tri_en <= (not add_bus(7)) and (not add_bus(6)) and (add_bus(5)) and (add_bus(4)) and (not add_bus(3)) and (not add_bus(2)) and (not add_bus(1)) and (not add_bus(0)) and (not rd_wr);
	
	timer0_comp: timer0 port map(data_bus,clk,rd_wr,ext_clk,en,add_bus(0),rst,timer0_add_en,int0);
	timer1_comp: timer1 port map(data_bus,clk,rd_wr,en,add_bus(0),rst,timer1_add_en,int1);
	pwm_comp: pwm port map(data_bus,clk,rd_wr,en,add_bus(0),rst,pwm_add_en,pwm_out);
	GPIO_comp: GPIO port map(data_bus,pins,clk,rd_wr,en,add_bus(1),add_bus(0),rst,GPIO_add_en,tmp_int0,tmp_int1,pwm_out);

	int_en_reg_comp : my_nDFF port map(clk,rst,int_reg_en,data_bus,int_en_reg);
	int_en_tri : tri_state_buffer port map(int_tri_en,int_en_reg,data_bus);
	
	tmp_int0 <= int0 and (not int_en_reg(0)); -- active low
	tmp_int1 <= int1 and (not int_en_reg(1)); -- active low

	Global_INT <= tmp_int0 or tmp_int1;
	
end struct;


Library ieee;
Use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
entity prescaler is
  port( clk,rst :in std_logic;
        in_pre:in std_logic_vector(7 downto 0);
        out_clk:out std_logic
        );
end prescaler;
architecture Behavioral of prescaler is
	
	Component my_nDFF is
		Generic ( n : integer := 8);
		port( clk,rst,e : in std_logic;
		d : in std_logic_vector(n-1 downto 0);
		q : out std_logic_vector(n-1 downto 0));
	end Component;
	
	signal counter,counter_in,temp_pre :std_logic_vector(7 downto 0);
begin

	temp_pre <= in_pre(6 downto 0) & '0';
	count_reg : my_nDFF port map(clk,rst,'1',counter_in,counter);

	
	out_clk<= '1' when counter < in_pre and rst = '0'
	else '0' when counter<temp_pre  and rst = '0'
	else '0' when rst='1';	
	
	counter_in <= "00000000" when counter=temp_pre-1
	else counter+1;
	

end Behavioral; 
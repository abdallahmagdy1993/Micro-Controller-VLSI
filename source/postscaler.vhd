Library ieee;
Use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
entity Postscaler is
  port( clk,rst,In_intr :in std_logic;
        in_post:in std_logic_vector(7 downto 0);
        out_intr:out std_logic
        );
end Postscaler;

architecture arch_post of Postscaler is
 	signal ld:std_logic;
	signal count :std_logic_vector(7 downto 0);
begin
out_intr<='1'when count=in_post and rst='0'
else '0';
	
	process(clk,rst,In_intr)
		begin
		if(rst='1')then
			count<= "00000000";
		elsif(count=in_post and clk='0')then
			count<= "00000000";
		elsif(rising_edge(In_intr))then
			count<=count+1;
		end if;
	end process;

end arch_post; 
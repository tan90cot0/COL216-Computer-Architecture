library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyTypes.all;
use IEEE.NUMERIC_STD.ALL;

entity shifter4 is
 Port  (
 		input: in word;
 		sel: in std_logic;
 		shift_type: in bit_pair;
        carryin: in std_logic;
   		carryout: out std_logic;
    	output: out word
    );
 end shifter4;

architecture beh of shifter4 is
begin 
process(input,sel)
begin
if(sel='1') then
	if(shift_type = "00") then
      output(31 downto 4)<=input(27 downto 0);
      output(3 downto 0)<="0000";
      
    else
	output(27 downto 0)<=input(31 downto 4);
    
    with shift_type select
    output(31 downto 28)<=
                  "0000" when "01",
                  input(31) & input(31) & input(31) & input(31) when "10",
                  input(3 downto 0) when "11",
                  "0000" when others;
    carryout<= input(3);
    end if;
    
else
	output<=input;
    carryout<=carryin;
end if;

end process;
end beh;
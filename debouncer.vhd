library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity debounce is
Port ( clock, clr: in STD_LOGIC;
inp : in std_logic_vector(3 downto 0);
outp : out STD_LOGIC_vector(3 downto 0) );
end debounce;
architecture Behavioral of debounce is
signal count : STD_LOGIC_VECTOR (17 downto 0);
signal clk190 : std_logic;
signal delay1, delay2, delay3: std_logic_vector(3 downto 0);
begin
PROCESS( clr, clock )
BEGIN
IF clr = '0' THEN
count <= (others => '0') ;
ELSIF Clock'EVENT AND Clock = '1' THEN
count <= count+1 ;
ENDIF ;
ENDPROCESS;
clk190<=count(17);
process (clr, clk190)
begin
if clr='0' then
delay1<="0000";
delay2<="0000";
delay3<="0000";
elsif clk190'event and clk190='1' then
delay1 <=inp;
delay2 <=delay1;
delay3<=delay2;
end if;
end process;
outp<=delay1 and delay2 and delay3;
end Behavioral;

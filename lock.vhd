library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity lock is
Port ( b : in STD_LOGIC_VECTOR (3 downto 0);
clock2 : in STD_LOGIC;
clear : in STD_LOGIC;
z : out STD_LOGIC_VECTOR (1 downto 0));
end lock;
architecture Behavioral of lock is
TYPE State_type IS (R0, WR0, R1, WR1, R2, WR2, R3, WE0, E1, WE1, E2, WE2, E3);
SIGNAL y : State_type;
begin
PROCESS(clear, clock2)
BEGIN
IF clear='0' THEN
y<=R0;
ELSIF (clock2'EVENT AND clock2='1') THEN
CASE yIS
WHEN R0=>
IF b="0000" THEN
y<=R0;
ELSIF b="0001" THEN
y<=WR0;
ELSE
y<=WE0;
ENDIF;
WHEN WR0=>
IF b="0000" THEN
y<=R1;
ELSE
y<=WR0;
ENDIF;
WHEN R1=>
IF b="0000" THEN
y<=R1;
ELSIF b="0100" THEN
y<=WR1;
ELSE
y<=WE1;
ENDIF;
WHEN WR1=>
IF b="0000" THEN
y<=R2;
ELSE
y<=WR1;
ENDIF;
WHEN R2=>
IF b="0000" THEN
y<=R2;
ELSIF b="1000" THEN
y<=WR2;
ELSE
y<=WE2;
ENDIF;
WHEN WR2=>
IF b="0000" THEN
y<=R3;
ELSE
y<=WR2;
ENDIF;
WHEN R3=>
IF b="0000" THEN
y<=R3;
ELSIF b="0001" THEN
y<=WR0;
ELSE
y<=WE0;
ENDIF;
WHEN WE0=>
IF b="0000" THEN
y<=E1;
ELSE
y<=WE0;
ENDIF;
WHEN E1=>
IF b="0000" THEN
y<=E1;
ELSE
y<=WE1;
ENDIF;
WHEN WE1=>
IF b="0000" THEN
y<=E2;
ELSE
y<=WE1;
ENDIF;
WHEN E2=>
IF b="0000" THEN
y<=E2;
ELSE
y<=WE2;
ENDIF;
WHEN WE2=>
IF b="0000" THEN
y<=E3;
ELSE
y<=WE2;
ENDIF;
WHEN E3=>
IF b="0000" THEN
y<=E3;
ELSIF b="0001" THEN
y<=WR0;
ELSE
y<=WE0;
ENDIF;
ENDCASE;
ENDIF;
ENDPROCESS;
z <= "01" when y=R3 else
"10" when y=E3 else
"00";
end Behavioral;

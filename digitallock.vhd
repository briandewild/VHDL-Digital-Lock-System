library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity digitallock is
Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
CLK1 : in STD_LOGIC;
CLR1 : in STD_LOGIC;
z1 : out STD_LOGIC_VECTOR (1 downto 0));
end digitallock;

architecture Structural of digitallock is
SIGNAL wiresig : STD_LOGIC_VECTOR(3 downto 0);
component debounce
PORT ( clock, clr :IN STD_LOGIC;
inp :IN STD_LOGIC_VECTOR(3 downto 0);
outp :OUT STD_LOGIC_VECTOR(3 downto 0));
end component;

component lock
PORT (b : in STD_LOGIC_VECTOR (3 downto 0);
clock2 : in STD_LOGIC;
clear : in STD_LOGIC;
z : OUT STD_LOGIC_VECTOR(1 downto 0));
end component;

begin
Stage0: debounce PORT MAP (
inp(3) => btn(3),
inp(2) => btn(2),
inp(1) => btn(1),
inp(0) => btn(0),
clock => CLK1,
clr => CLR1,
outp(3) => wiresig(3),
outp(2) => wiresig(2),
outp(1) => wiresig(1),
outp(0) => wiresig(0));
Stage1: lock PORT MAP (
b(3) => wiresig(3),
b(2) => wiresig(2),
b(1) => wiresig(1),
b(0) => wiresig(0),
clock2 => CLK1,
clear => CLR1,
z(1) => z1(1),
z(0) => z1(0)
);
end Structural;

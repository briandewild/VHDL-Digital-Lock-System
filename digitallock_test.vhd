library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY lock_test IS
ENDlock_test;
ARCHITECTURE behavior OF lock_test IS-- Component Declaration for the Unit Under Test (UUT)
COMPONENTlock
PORT(
clear : IN std_logic;
clock2 : IN std_logic;
b : IN std_logic_vector(3 downto 0);
z : OUT std_logic_vector(1 downto 0)
);
ENDCOMPONENT;--Inputs
signal clear : std_logic := '0';
signal clock2 : std_logic := '0';
signal b : std_logic_vector(3 downto 0) := (others => '0');--Outputs
signal z : std_logic_vector(1 downto 0);-- Clock period definitions
constant clock_period : time := 20ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: lock PORT MAP (
clear => clear,
clock2 => clock2,
b => b,
z => z
);-- Clock process definitions
clock_process :process
begin
clock2 <= '0';
wait for clock_period/2;
clock2 <= '1';
wait for clock_period/2;
end process;-- Stimulus process
stim_proc: process
begin-- test clr
clear<='0';
wait for 30ns;
clear<='1';-- test using correct secret code
b<="0001";
wait for 40ns;
b<="0000";
wait for 40ns;
b<="0100";
wait for 40ns;
b<="0000";
wait for 40ns;
b<="1000";
wait for 40ns;
b<="0000";
wait for 40ns;-- test incorrect code
b<="0001";
wait for 40ns;
b<="0000";
wait for 40ns;
b<="1000";
wait for 40ns;
b<="0000";
wait for 40ns;
b<="0010";
wait for 40ns;
b<="0000";
wait for 40ns;
end process;
END;

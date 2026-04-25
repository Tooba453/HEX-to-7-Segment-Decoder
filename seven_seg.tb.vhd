----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2025 15:58:09
-- Design Name: 
-- Module Name: seven_seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevenseg_tb is
end sevenseg_tb;

architecture behavior of sevenseg_tb is
    -- Signals for the DUT
    signal clk         : std_logic := '0';
    signal reset_clk   : std_logic := '1';
    signal bcd         : std_logic_vector(3 downto 0) := "0000";
    signal sevseg      : std_logic_vector(6 downto 0);
    signal EN          : std_logic_vector(7 downto 0);
    signal clk_out     : std_logic;

    -- Component declaration for the sevenseg
    component sevenseg is
        Port (
            clk_in    : in  STD_LOGIC;
            reset_clk : in  STD_LOGIC;
            clk_out   : out STD_LOGIC;
            bcd       : in  std_logic_vector(3 downto 0);
            sevseg    : out std_logic_vector(6 downto 0);
            EN        : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- Instantiate the DUT
    uut: sevenseg
        port map (
            clk_in    => clk,
            reset_clk => reset_clk,
            clk_out   => clk_out,
            bcd       => bcd,
            sevseg    => sevseg,
            EN        => EN
        );

    -- Clock process: 100 MHz
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        reset_clk <= '1';
        wait for 20 ns;
        reset_clk <= '0';
        wait for 20 ns;

        bcd <= "0000"; wait for 100 ns;
        bcd <= "0001"; wait for 100 ns;
        bcd <= "0010"; wait for 100 ns;
        bcd <= "0011"; wait for 100 ns;
        bcd <= "0100"; wait for 100 ns;
        bcd <= "0101"; wait for 100 ns;
        bcd <= "0110"; wait for 100 ns;
        bcd <= "0111"; wait for 100 ns;
        bcd <= "1000"; wait for 100 ns;
        bcd <= "1001"; wait for 100 ns;
        bcd <= "1010"; wait for 100 ns;  
        bcd <= "1011"; wait for 100 ns;  
        bcd <= "1100"; wait for 100 ns;  
        bcd <= "1101"; wait for 100 ns;  
        bcd <= "1110"; wait for 100 ns;  
        bcd <= "1111"; wait for 100 ns;  
        wait;
    end process;

end behavior;


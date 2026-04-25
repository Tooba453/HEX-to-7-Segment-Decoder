----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2025 16:00:32
-- Design Name: 
-- Module Name: sevenseg - Behavioral
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

entity sevenseg is
    Port (
        clk_in   : in  STD_LOGIC;
        reset_clk: in  STD_LOGIC;
        clk_out  : out STD_LOGIC;
        bcd      : in  std_logic_vector(3 downto 0);
        sevseg   : out std_logic_vector(6 downto 0);
        EN       : out std_logic_vector(7 downto 0)
    );
end sevenseg;

architecture structure of sevenseg is
    signal leds     : std_logic_vector(6 downto 0);
    signal counter  : unsigned(24 downto 0) := (others => '0');
    signal slow_clk : std_logic := '0';
    signal EN_reg   : std_logic_vector(7 downto 0) := "11111110";  -- first display active
begin


    -- 7-segment hex decoder (active-high output)
    with bcd select
        leds <= "1111110" when "0000",  -- 0
                "0110000" when "0001",  -- 1
                "1101101" when "0010",  -- 2
                "1111001" when "0011",  -- 3
                "0110011" when "0100",  -- 4
                "1011011" when "0101",  -- 5
                "1011111" when "0110",  -- 6
                "1110000" when "0111",  -- 7
                "1111111" when "1000",  -- 8
                "1111011" when "1001",  -- 9
                "1110111" when "1010",  -- A
                "0011111" when "1011",  -- b
                "1001110" when "1100",  -- C
                "0111101" when "1101",  -- d
                "1001111" when "1110",  -- E
                "1000111" when "1111",  -- F
                "0000000" when others;  -- all off

    -- Invert for active-low seven-segment
    sevseg <= not leds;

    -- Clock divider process
    process(clk_in, reset_clk)
    begin
        if reset_clk = '1' then
            counter  <= (others => '0');
            slow_clk <= '0';
        elsif rising_edge(clk_in) then
            if counter = to_unsigned(9, counter'length) then -- small for simulation
                counter  <= (others => '0');
                slow_clk <= not slow_clk;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= slow_clk;
    -- Display enable multiplexer (toggle between two digits)
    process(slow_clk, reset_clk)
    begin
        if reset_clk = '1' then
            EN_reg <= "11111110";
        elsif rising_edge(slow_clk) then
            if EN_reg = "11111110" then
                EN_reg <= "11111011";
            else
                EN_reg <= "11111110";
            end if;
        end if;
    end process;

    EN <= EN_reg;

end structure;



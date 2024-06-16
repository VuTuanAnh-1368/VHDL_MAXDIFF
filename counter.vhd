LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Counter IS
    GENERIC (
        DATA_WIDTH : INTEGER := 8 
    );
    PORT (
        CLK       : IN  STD_LOGIC;
        Reset     : IN  STD_LOGIC;
        LD_i      : IN  STD_LOGIC;  -- Perhaps rename this for clarity
        En_cnt    : IN  STD_LOGIC;  -- Enable counting
        Count_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
    );
END Counter;

ARCHITECTURE Behavioral OF Counter IS
    SIGNAL counter_reg : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := (others => '0');
BEGIN
    counter_process : PROCESS(CLK)
    BEGIN
        IF rising_edge(CLK) THEN
            IF Reset = '1' THEN
                counter_reg <= (others => '0'); 
            ELSIF En_cnt = '1' THEN
                counter_reg <= std_logic_vector(unsigned(counter_reg) + 1); 
            END IF;
            -- Update output after processing logic
            Count_out <= counter_reg;
        END IF;
    END PROCESS;
END Behavioral;

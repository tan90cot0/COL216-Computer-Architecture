LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    use work.MyTypes.all;

ENTITY DM IS
  PORT(
       DATAIN : IN word;
       ADDRESS : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
       write : IN nibble;
       clk : in std_logic;
       DATAOUT : OUT word
       );
END ENTITY;


ARCHITECTURE BEV OF DM IS

SIGNAL MEMORY : memory_type;
SIGNAL ADDR : INTEGER RANGE 0 TO 63;

BEGIN
    ADDR<=CONV_INTEGER(ADDRESS);
    DATAOUT<=MEMORY(ADDR);
    process(clk)
        begin   
        if (rising_edge(clk)) then
            IF(write(0)='1')THEN
                MEMORY(ADDR)(7 DOWNTO 0)<=DATAIN(7 DOWNTO 0);
            end if;
            IF(write(1)='1')THEN
                MEMORY(ADDR)(15 DOWNTO 8)<=DATAIN(15 DOWNTO 8);
            end if;
            IF(write(2)='1')THEN
                MEMORY(ADDR)(23 DOWNTO 16)<=DATAIN(23 DOWNTO 16);
            end if;
            IF(write(3)='1')THEN
                MEMORY(ADDR)(31 DOWNTO 24)<=DATAIN(31 DOWNTO 24);
            end if;
        end if;
  END PROCESS;
END BEV;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.LIBRA.all;

ENTITY MAXDIFF IS
  GENERIC(
        DATA_WIDTH : INTEGER := 8
);
  PORT(
        RST, CLK: IN STD_LOGIC;
        Start_i : IN STD_LOGIC;
        data_in, ADDR_in : IN STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
        data_o : OUT STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
        Done : OUT STD_LOGIC
  ); 

END MAXDIFF;

ARCHITECTURE RTL OF MAXDIFF IS
 SIGNAL rt_i, check_i, min_sl, max_sl ,  En_max, En_min, En_cnt, En_dt,  max_sel, min_sel, En_o, LD_i, RE, WE,i: STD_LOGIC;
 SIGNAL L: STD_LOGIC_VECTOR(DATA_WIDTH -1 downto 0);
 SIGNAL  MaxDIFF , RESULT:  STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
 BEGIN
CTRL_UNIT: CONTROLLER
 GENERIC MAP( DATA_WIDTH => DATA_WIDTH)

  PORT MAP(
        RST, CLK,
        rt_i, check_i, min_sl, max_sl ,
        En_max, En_min, En_cnt, En_dt,  max_sel, min_sel, En_o, LD_i,
        START_i,
        RE, WE,
        Done ,
        MaxDIFF ,
        RESULT 
);

DATPATH : DATAPATH
  GENERIC MAP(
        DATA_WIDTH => DATA_WIDTH)
  PORT MAP(
        RST, CLK, RE, WE, START_i, LD_i,
	En_max, En_min, En_dt, En_o,En_cnt,
        result, data_in ,
	ADDR_in ,
	L,
        max_sel, min_sel,
	rt_i, check_i,
        maxDiff ,
	max_sl, min_sl
  );

 END RTL;
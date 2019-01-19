library verilog;
use verilog.vl_types.all;
entity stopwatch_01 is
    generic(
        DELAY_TIME      : integer := 10000000
    );
    port(
        clk             : in     vl_logic;
        key_reset       : in     vl_logic;
        key_start_pause : in     vl_logic;
        key_display_stop: in     vl_logic;
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        led0            : out    vl_logic;
        led1            : out    vl_logic;
        led2            : out    vl_logic;
        led3            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DELAY_TIME : constant is 1;
end stopwatch_01;

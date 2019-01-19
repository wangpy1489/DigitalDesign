library verilog;
use verilog.vl_types.all;
entity pipelined_computer_main is
    port(
        resetn          : in     vl_logic;
        clock           : in     vl_logic;
        mem_clock       : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        ealu            : out    vl_logic_vector(31 downto 0);
        malu            : out    vl_logic_vector(31 downto 0);
        walu            : out    vl_logic_vector(31 downto 0);
        out_port0       : out    vl_logic_vector(31 downto 0);
        out_port1       : out    vl_logic_vector(31 downto 0);
        out_port2       : out    vl_logic_vector(31 downto 0);
        in_port0        : in     vl_logic_vector(31 downto 0);
        in_port1        : in     vl_logic_vector(31 downto 0);
        mem_dataout     : out    vl_logic_vector(31 downto 0);
        io_read_data    : out    vl_logic_vector(31 downto 0);
        wpcir           : out    vl_logic;
        dwreg           : out    vl_logic;
        ewreg           : out    vl_logic;
        mwreg           : out    vl_logic;
        mwmem           : out    vl_logic;
        io_out          : out    vl_logic
    );
end pipelined_computer_main;

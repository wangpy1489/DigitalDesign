library verilog;
use verilog.vl_types.all;
entity cpu_clk is
    port(
        inclk           : in     vl_logic;
        outclk          : out    vl_logic
    );
end cpu_clk;

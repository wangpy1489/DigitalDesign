library verilog;
use verilog.vl_types.all;
entity mem_clock is
    generic(
        N               : integer := 2
    );
    port(
        refclk          : in     vl_logic;
        resetn          : in     vl_logic;
        outclk          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end mem_clock;

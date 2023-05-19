library verilog;
use verilog.vl_types.all;
entity COMPARATOR_vlg_check_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        state           : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end COMPARATOR_vlg_check_tst;

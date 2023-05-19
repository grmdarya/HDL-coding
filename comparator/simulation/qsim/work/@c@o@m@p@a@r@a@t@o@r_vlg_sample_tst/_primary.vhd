library verilog;
use verilog.vl_types.all;
entity COMPARATOR_vlg_sample_tst is
    port(
        A0_A3           : in     vl_logic_vector(3 downto 0);
        B0_B3           : in     vl_logic_vector(3 downto 0);
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end COMPARATOR_vlg_sample_tst;

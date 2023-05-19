library verilog;
use verilog.vl_types.all;
entity COMPARATOR is
    port(
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        A0_A3           : in     vl_logic_vector(3 downto 0);
        B0_B3           : in     vl_logic_vector(3 downto 0);
        A               : out    vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        state           : out    vl_logic_vector(1 downto 0)
    );
end COMPARATOR;

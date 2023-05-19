library verilog;
use verilog.vl_types.all;
entity counter4 is
    port(
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        number          : out    vl_logic_vector(3 downto 0);
        carryBit        : out    vl_logic
    );
end counter4;

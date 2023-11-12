`timescale 1ns / 1ps

module tb_PE_FSM();

    // Testbench Signals
    reg clk, rst_n, start_conv, start_again;
    reg [1:0] cfg_ci, cfg_co;
    wire ifm_read, wgt_read, p_valid_output, last_chanel_output, end_conv;

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 ns
    end

    // Instance of PE_FSM
    PE_FSM uut (
        .clk(clk),
        .rst_n(rst_n),
        .start_conv(start_conv),
        .start_again(start_again),
        .cfg_ci(cfg_ci),
        .cfg_co(cfg_co),
        .ifm_read(ifm_read),
        .wgt_read(wgt_read),
        .p_valid_output(p_valid_output),
        .last_chanel_output(last_chanel_output),
        .end_conv(end_conv)
    );

    // Test Sequence
    initial begin
        // Initialize Inputs
        rst_n = 1;
        start_conv = 0;
        start_again = 0;
        cfg_ci = 0;
        cfg_co = 0;

        // Reset the module
        #10;
        rst_n = 0;
        #10;
        rst_n = 1;
        #10;

        // Start the operation
        start_conv = 1;
        cfg_ci = 2'b01; // Example configuration
        cfg_co = 2'b10; // Example configuration
        #20;
        start_conv = 0;

        // Add further test stimuli and checks as needed

        // Finish the simulation
        #100;
        $finish;
    end

endmodule

`timescale 1ns/1ps

module vending_machine_tb;

    reg clk;
    reg reset;
    reg coin_5;
    reg coin_10;

    wire product;
    wire [3:0] change;

    // Connect vending machine
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin_5(coin_5),
        .coin_10(coin_10),
        .product(product),
        .change(change)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform file
        $dumpfile("output.vcd");
        $dumpvars(0, vending_machine_tb);

        // Initial values
        clk = 0;
        reset = 1;
        coin_5 = 0;
        coin_10 = 0;

        #10;

        // Release reset
        reset = 0;

        // Insert 5-unit coin
        coin_5 = 1;
        #10;

        // Stop coin
        coin_5 = 0;
        #10;

        // Insert another 5-unit coin
        coin_5 = 1;
        #10;

        // Stop coin
        coin_5 = 0;
        #10;

        // Reset for next test
        reset = 1;
        #10;

        // Release reset
        reset = 0;

        // Insert 10-unit coin
        coin_10 = 1;
        #10;

        coin_10 = 0;
        #10;

        $finish;

    end

endmodule
module vending_machine (
    input clk,
    input reset,
    input coin_5,
    input coin_10,
    output reg product,
    output reg [3:0] change
);

    reg [3:0] balance;

    always @(posedge clk) begin

        if (reset) begin
            balance <= 4'd0;
            product <= 1'b0;
            change <= 4'd0;
        end

        else begin

            // Default outputs
            product <= 1'b0;
            change <= 4'd0;

            // Insert 10-unit coin
            if (coin_10) begin

                if (balance + 4'd10 >= 4'd10) begin
                    product <= 1'b1;
                    change <= balance;
                    balance <= 4'd0;
                end

            end

            // Insert 5-unit coin
            else if (coin_5) begin

                if (balance + 4'd5 >= 4'd10) begin
                    product <= 1'b1;
                    change <= balance + 4'd5 - 4'd10;
                    balance <= 4'd0;
                end

                else begin
                    balance <= balance + 4'd5;
                end

            end

        end

    end

endmodule
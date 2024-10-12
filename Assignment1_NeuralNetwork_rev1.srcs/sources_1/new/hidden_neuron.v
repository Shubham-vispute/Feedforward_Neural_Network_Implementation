module hidden_neuron(
    input signed [7:0] in1, in2, in3, in4,  // 4 inputs, 8-bit each
    input signed [7:0] w1, w2, w3, w4,      // Weights, 8-bit each
    input signed [7:0] bias,                // Bias, 8-bit
    output reg signed [7:0] out             // Output of the neuron, 8-bit
);
    reg signed [15:0] sum;  // Intermediate sum (16-bit to avoid overflow)

    always @(*) begin
        // Weighted sum of inputs with bias
        sum = (w1 * in1) + (w2 * in2) + (w3 * in3) + (w4 * in4) + bias;

        // Apply ReLU activation: max(0, sum)
        if (sum < 0)
            out = 8'd0;
        else if (sum > 127) // Ensure it doesn't exceed 8-bit signed maximum
            out = 8'd127;
        else
            out = sum[7:0];  // Output the lower 8 bits safely
    end
endmodule

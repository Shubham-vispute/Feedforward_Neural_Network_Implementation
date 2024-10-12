module output_neuron(
    input signed [7:0] hidden_out1, hidden_out2, hidden_out3, // Outputs from hidden layer neurons
    input signed [7:0] w1, w2, w3,      // Weights for the hidden layer neuron outputs
    input signed [7:0] bias,            // Bias for the output neuron
    output reg signed [7:0] out         // Output of the neuron, 8-bit
);
    reg signed [15:0] sum;  // Intermediate sum, 16-bit to avoid overflow

    always @(*) begin
        // Weighted sum of the hidden layer outputs
        sum = (w1 * hidden_out1) + (w2 * hidden_out2) + (w3 * hidden_out3) + bias;

        // Apply ReLU activation function: max(0, sum)
        if (sum < 0)
            out = 8'd0;
        else if (sum > 127)
            out = 8'd127;  // Cap to the maximum 8-bit signed value
        else
            out = sum[7:0];  // Safely take the lower 8 bits
    end
endmodule

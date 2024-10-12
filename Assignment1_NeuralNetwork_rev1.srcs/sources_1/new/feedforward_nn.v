//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 23:06:48
// Design Name: 
// Module Name: feedforward_nn
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module feedforward_nn(
    input signed [7:0] in1, in2, in3, in4,     // 4 inputs, 8-bit each
    output reg signed [7:0] out1, out2,        // 2 outputs, 8-bit each (representing two classes)
    input signed [7:0] h1_w1, h1_w2, h1_w3, h1_w4, // Weights for hidden neuron 1
    input signed [7:0] h2_w1, h2_w2, h2_w3, h2_w4, // Weights for hidden neuron 2
    input signed [7:0] h3_w1, h3_w2, h3_w3, h3_w4, // Weights for hidden neuron 3
    input signed [7:0] o1_w1, o1_w2, o1_w3,        // Weights for output neuron 1
    input signed [7:0] o2_w1, o2_w2, o2_w3,        // Weights for output neuron 2
    input signed [7:0] bias1, bias2, bias3,        // Bias for hidden neurons
    input signed [7:0] out_bias1, out_bias2        // Bias for output neurons
);
    // Intermediate outputs for the hidden layer
    wire signed [7:0] hidden_out1, hidden_out2, hidden_out3;

    // Instantiate hidden neurons
    hidden_neuron h1(.in1(in1), .in2(in2), .in3(in3), .in4(in4),
                     .w1(h1_w1), .w2(h1_w2), .w3(h1_w3), .w4(h1_w4),
                     .bias(bias1), .out(hidden_out1));

    hidden_neuron h2(.in1(in1), .in2(in2), .in3(in3), .in4(in4),
                     .w1(h2_w1), .w2(h2_w2), .w3(h2_w3), .w4(h2_w4),
                     .bias(bias2), .out(hidden_out2));

    hidden_neuron h3(.in1(in1), .in2(in2), .in3(in3), .in4(in4),
                     .w1(h3_w1), .w2(h3_w2), .w3(h3_w3), .w4(h3_w4),
                     .bias(bias3), .out(hidden_out3));

    // Output neurons to combine hidden layer results
    always @(*) begin
        // Output neuron 1: weighted sum of hidden neurons
        out1 = (o1_w1 * hidden_out1) + (o1_w2 * hidden_out2) + (o1_w3 * hidden_out3) + out_bias1;
        if (out1 < 0)
            out1 = 8'd0;  // Apply ReLU
        else if (out1 > 127)
            out1 = 8'd127;  // Cap the value

        // Output neuron 2: weighted sum of hidden neurons
        out2 = (o2_w1 * hidden_out1) + (o2_w2 * hidden_out2) + (o2_w3 * hidden_out3) + out_bias2;
        if (out2 < 0)
            out2 = 8'd0;  // Apply ReLU
        else if (out2 > 127)
            out2 = 8'd127;  // Cap the value
    end
endmodule


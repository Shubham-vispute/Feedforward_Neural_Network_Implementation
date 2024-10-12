//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 23:09:14
// Design Name: 
// Module Name: testbench
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
module testbench();
    // Input signals
    reg signed [7:0] in1, in2, in3, in4;
    
    // Output signals
    wire signed [7:0] out1, out2;

    // Weights and biases for the hidden layer
    reg signed [7:0] h1_w1, h1_w2, h1_w3, h1_w4;
    reg signed [7:0] h2_w1, h2_w2, h2_w3, h2_w4;
    reg signed [7:0] h3_w1, h3_w2, h3_w3, h3_w4;
    reg signed [7:0] bias1, bias2, bias3;

    // Weights and biases for the output layer
    reg signed [7:0] o1_w1, o1_w2, o1_w3;
    reg signed [7:0] o2_w1, o2_w2, o2_w3;
    reg signed [7:0] out_bias1, out_bias2;

    // Instantiate the neural network
    feedforward_nn nn(
        .in1(in1), .in2(in2), .in3(in3), .in4(in4),
        .out1(out1), .out2(out2),
        .h1_w1(h1_w1), .h1_w2(h1_w2), .h1_w3(h1_w3), .h1_w4(h1_w4),
        .h2_w1(h2_w1), .h2_w2(h2_w2), .h2_w3(h2_w3), .h2_w4(h2_w4),
        .h3_w1(h3_w1), .h3_w2(h3_w2), .h3_w3(h3_w3), .h3_w4(h3_w4),
        .bias1(bias1), .bias2(bias2), .bias3(bias3),
        .o1_w1(o1_w1), .o1_w2(o1_w2), .o1_w3(o1_w3),
        .o2_w1(o2_w1), .o2_w2(o2_w2), .o2_w3(o2_w3),
        .out_bias1(out_bias1), .out_bias2(out_bias2)
    );

    initial begin
        // Initialize weights and biases for the hidden and output layers
        h1_w1 = 8'd1; h1_w2 = 8'd2; h1_w3 = 8'd3; h1_w4 = 8'd4;
        h2_w1 = -8'd1; h2_w2 = 8'd2; h2_w3 = -8'd3; h2_w4 = 8'd4;
        h3_w1 = 8'd2; h3_w2 = 8'd1; h3_w3 = 8'd2; h3_w4 = 8'd1;
        bias1 = 8'd1; bias2 = -8'd1; bias3 = 8'd2;

        o1_w1 = 8'd1; o1_w2 = 8'd2; o1_w3 = 8'd3;
        o2_w1 = -8'd1; o2_w2 = 8'd1; o2_w3 = -8'd1;
        out_bias1 = 8'd1; out_bias2 = -8'd1;

        // Apply test inputs
        // Test Case 1
        in1 = 8'd11; in2 = 8'd22; in3 = 8'd33; in4 = 8'd44;
        #10;

        // Test Case 2
        in1 = -8'd10; in2 = 8'd15; in3 = -8'd20; in4 = 8'd25;
        #10;

        // Test Case 3
        in1 = 8'd5; in2 = 8'd25; in3 = 8'd15; in4 = -8'd10;
        #10;

        $finish;
    end

    // Monitor output during simulation
    initial begin
        $monitor("Time: %0d, Inputs: (%d, %d, %d, %d), Outputs: (%d, %d)", 
                 $time, in1, in2, in3, in4, out1, out2);
    end
endmodule



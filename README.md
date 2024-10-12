
# Feedforward Neural Network in Verilog

## Project Overview
This project implements a simple feedforward neural network (FNN) in Verilog for classification tasks. The network architecture consists of:
- **Input Layer**: 4 inputs (each 8-bit wide)
- **Hidden Layer**: 3 neurons
- **Output Layer**: 2 neurons
- **Activation Function**: ReLU (Rectified Linear Unit)

The project uses Vivado for simulation and verification of the neural network's functionality. Signed 8-bit integers are used for inputs, weights, and biases. The neural network's behaviour is tested using various input sets through a Verilog testbench.

## Features
- Implements a feedforward neural network with ReLU activation.
- Uses signed 8-bit values for inputs, weights, and biases.
- Designed for FPGA implementation and verified using Vivado.
- Modular code structure with separate modules for hidden and output neurons.
- Testbench for functional verification with multiple test cases.

## Neural Network Architecture
The neural network consists of the following components:
- **Input Layer**: 4 inputs (signed 8-bit integers)
- **Hidden Layer**: 3 neurons, each taking all 4 inputs and outputting through a ReLU activation function.
- **Output Layer**: 2 neurons, each receiving inputs from all hidden neurons and outputting through ReLU.

### ReLU Activation Function
ReLU is applied to each neuron output, ensuring non-linearity:
```
ReLU(x) = max(0, x)
```

## Simulation Instructions

### Step 1: Setup Vivado
1. Open Vivado and create a new project.
2. Add the Verilog source files (`feedforward_nn.v`, `hidden_neuron.v`, `output_neuron.v`) to your project.
3. Add the `testbench.v` file for simulation purposes.

### Step 2: Run Simulation
1. In the Vivado TCL console, run the following commands to simulate:
   ```tcl
   restart
   run 100ns
   ```
2. This will simulate the network for 100ns, running the testbench with predefined input values.

### Step 3: View Output Waveforms
1. After simulation, view the waveform window in Vivado to verify output values (`out1`, `out2`) for each input set.
2. Confirm that the output values match the expected results based on the input test cases.

## Test Cases and Expected Outputs

### Test Case 1
- **Inputs**: (11, 22, 33, 44)
- **Expected Outputs**: (0, 110)

### Test Case 2
- **Inputs**: (-10, 15, -20, 25)
- **Expected Outputs**: (60, 65)

### Test Case 3
- **Inputs**: (5, 25, 15, -10)
- **Expected Outputs**: (0, 0)

## Challenges
1. **Signed Arithmetic**: Handling signed integers (positive and negative values) for inputs, weights, and biases.
2. **ReLU Implementation**: Ensuring correct activation behaviour with ReLU, particularly for negative values.
3. **FPGA Simulation**: Proper timing and synchronization in simulation to ensure the expected output.

## Future Work
- Expanding the neural network to have more layers or neurons for complex tasks.
- Exploring different activation functions like Sigmoid or Tanh.
- Adding training capability to adjust weights and biases for real-world applications.



## Author
- Shubham Kishor Vispute

## How to Contribute
Feel free to submit issues or pull requests to contribute to the project.


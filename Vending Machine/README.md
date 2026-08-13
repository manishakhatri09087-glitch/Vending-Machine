# Vending Machine

## Description

This project implements a simple Vending Machine using Verilog HDL.

The machine accepts coins and provides a product when the required amount is reached.

## Working

The price of the product is 10 units.

- Insert 5 units → Balance becomes 5
- Insert another 5 units → Product is dispensed
- The `product` output becomes 1 when the product is dispensed
- The `change` output shows extra money, if any

## Inputs

| Input | Description |
|------|-------------|
| `clk` | Clock signal |
| `reset` | Resets the vending machine |
| `coin_5` | Insert 5-unit coin |
| `coin_10` | Insert 10-unit coin |

## Outputs

| Output | Description |
|------|-------------|
| `product` | 1 when product is dispensed |
| `change` | Extra money returned |

## Product Price

The product costs 10 units.

## Files

- `vending_machine.v` - Main Verilog code
- `vending_machine_tb.v` - Testbench
- `output.vcd` - Simulation waveform
- `README.md` - Project documentation

## Example

If the user inserts:

5 + 5 = 10

The machine gives:

Product = 1

If the user inserts:

10

The machine gives:

Product = 1

## How to Run

Compile:

    iverilog -o vending_sim vending_machine.v vending_machine_tb.v

Run:

    vvp vending_sim

Open waveform:

    gtkwave output.vcd

## Expected Result

The product is dispensed when the inserted amount reaches 10 units.

## Conclusion

The vending machine successfully accepts coins and dispenses a product when the required amount is reached.
### 8-bit ALU — Verilog HDL

A simple 8-bit Arithmetic Logic Unit (ALU) designed in Verilog HDL, based on a CPU architecture with a 3-bit operation selector.


## Supported Operations

| `aluop` | Operation | Expression |
|---|---|---|
| `3'b000` | Addition | `operand1 + operand2` |
| `3'b001` | Subtraction | `operand1 - operand2` |
| `3'b010` | Bitwise AND | `operand1 & operand2` |
| `3'b011` | Bitwise OR | `operand1 \| operand2` |
| `3'b100` | Bitwise XOR | `operand1 ^ operand2` |
| `3'b110` | Left Shift by 1 | `operand1 << 1` |
| `3'b111` | Right Shift by 1 | `operand1 >> 1` |
| `default` | Undefined | `8'bxxxxxxxx` |




## Implementation Notes

### Combinational Logic
The ALU uses an `always @(*)` block, meaning it is **purely combinational** — output updates instantly whenever any input changes. No clock is required.

### 9-bit Temp Register
For ADD and SUB operations, a 9-bit internal register `temp` is used:

```verilog
reg [8:0] temp;
temp = {1'b0, operand1} + {1'b0, operand2};
aluresult = temp[7:0];
```

This safely holds the full result before trimming to 8 bits, preventing unintended truncation behavior in simulation.

### Shift Operations
- **Left shift (`<< 1`)** is equivalent to multiplying by 2. The MSB is lost and LSB becomes 0.
- **Right shift (`>> 1`)** is equivalent to dividing by 2. The LSB is lost and MSB becomes 0.

### NOT Operation
NOT only operates on `operand1`. `operand2` is ignored for this operation.

---

## Limitations

- **No overflow detection** — addition/subtraction results silently wrap around if they exceed 8-bit range
- **No carry output** — carry out from addition is not exposed
- **No borrow output** — borrow from subtraction is not exposed
- **Unsigned only** — shift operations are logical (not arithmetic), so signed right shift is not supported
- **Multiplication/Division not included** — to avoid result width issues

---

---


### Tools 

- **Simulator:** Icarus Verilog (`iverilog`) or any standard Verilog simulator
- **Waveform Viewer:** GTKWave (for `.vcd` output)

```bash
iverilog -o alu_sim tb_alu.v alu.v
vvp alu_sim
gtkwave alu.vcd
```
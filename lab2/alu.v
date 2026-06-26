module alu (
    input  [7:0] operand1,
    input  [7:0] operand2,
    input  [2:0] aluop,
    output reg [7:0] aluresult
);

reg [8:0] temp;

always @(*) begin
    case (aluop)
        3'b000: begin
            temp      = {1'b0, operand1} + {1'b0, operand2};
            aluresult = temp[7:0];
        end
        3'b001: begin
            temp      = {1'b0, operand1} - {1'b0, operand2};
            aluresult = temp[7:0];
        end
        3'b010: aluresult = operand1 & operand2;
        3'b011: aluresult = operand1 | operand2;
        3'b100: aluresult = operand1 ^ operand2;
        3'b101: aluresult = ~operand1;
        3'b110: aluresult = operand1 << 1;
        3'b111: aluresult = operand1 >> 1;
        default: aluresult = 8'bxxxxxxxx;
    endcase
end

endmodule
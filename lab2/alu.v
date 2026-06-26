module alu (
    input [7:0] a,
    input [7:0] b,
    input [3:0] alu_sel,
    output reg[7:0] alu_result
);


always@(*)
begin
    case(alu_sel)
    4'b0000: alu_result= a + b;
    4'b0001: alu_result= a - b;
    4'b0010: alu_result= a * b; // don't enter number thatr results in 16 bit answer
    4'b0011: alu_result = (b != 0) ? (a / b) : 8'b0;
    4'b0100: alu_result= a & b;
    4'b0101: alu_result= a | b;
    4'b0110: alu_result= a ^ b;
    4'b0111: alu_result= ~(a & b) ;
    4'b1000: alu_result= ~(a | b);
    default: alu_result=8'bxxxxxxxx;
    endcase
end
    
endmodule
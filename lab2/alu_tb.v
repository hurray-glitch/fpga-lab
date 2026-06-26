`timescale 1ns/1ps

module alu_tb;

reg [7:0] a,b;
reg [3:0] alu_sel;
wire[7:0] alu_result;

alu uut(
.a(a),
.b(b),
.alu_sel(alu_sel),
.alu_result(alu_result)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, uut);

    a=8'd20;
    b=8'd5;

    alu_sel=4'b0000;
    #10;

    alu_sel=4'b0001;
    #10;

    alu_sel=4'b0010;
    #10;
    alu_sel = 4'b0011; 
    #10; 

    alu_sel = 4'b0100; 
    #10; 
    
    alu_sel = 4'b0101; 
    #10; 
     
    alu_sel = 4'b0110; 
    #10; 
    
    alu_sel = 4'b0111; 
    #10; 
    
    alu_sel = 4'b1000;
    #10;
    $finish;
end
endmodule
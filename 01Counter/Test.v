module Test(
  
);

reg clk;
reg rst_n;
reg en;
wire dout;

initial begin
    $dumpfile("Counter.vcd");
    $dumpvars(0, Test);
    $display("Begin dump!");

    $monitor("%g\t %b", $time, clk);

    #30 $finish;
end

initial begin
    clk = 1;
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    rst_n = 0;
    #1 rst_n = 1;
end

initial begin
    en = 0;
    #2 en = 1;
    #2 en = 0;
end

Counter c (
    .clk (clk), 
    .rst_n (rst_n), 
    .en (en), 
    .dout (dout)
);

endmodule // Test
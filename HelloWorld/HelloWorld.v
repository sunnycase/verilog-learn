module HelloWorld(
  
);

reg enable;

initial begin
    $dumpfile("HelloWorld.vcd");
    $dumpvars(0, HelloWorld);
    $display("Hello World!");

    $monitor("%g\t %b", $time, enable);

    enable = 0;
    #5 enable = 1;
    #10 $finish;
end

endmodule // HelloWorld
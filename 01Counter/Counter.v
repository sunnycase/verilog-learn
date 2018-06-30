module Counter(
  clk, en, rst_n,
  dout
);

input wire clk;
input wire en;
input wire rst_n;

output wire dout;

reg dout_r;
reg en_r;
reg[5:0] cnt_r;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        cnt_r <= 0;
    end
    else if (add_cond) begin
        if (end_cond)
            cnt_r <= 0;
        else
            cnt_r <= cnt_r + 1;
    end
end

assign add_cond = dout == 1;
assign end_cond = add_cond && cnt_r == 10 - 1;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        en_r <= 0;
    end
    else if (en) begin
        en_r <= 1;
    end
    else if (end_cond) begin
        en_r <= 0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        dout_r <= 0;
        en_r <= 0;
    end
    else if (end_cond) begin
        dout_r <= 0;
    end
    else if (en_r) begin
        dout_r <= 1;
    end
end

assign dout = dout_r;

endmodule // Counter

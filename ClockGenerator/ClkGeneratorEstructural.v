/* Generated by Yosys 0.7+659 (git sha1 51f1bbe, clang 3.5.0-10 -fPIC -Os) */

module ClkGeneratorEstructural(clk16f, reset_L, clk4f, clk2f, clkf);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [1:0] _04_;
  wire [2:0] _05_;
  wire [31:0] _06_;
  wire [31:0] _07_;
  wire [31:0] _08_;
  wire [15:0] _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire [2:0] _13_;
  wire [1:0] _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  input clk16f;
  output clk2f;
  reg clk2f;
  output clk4f;
  reg clk4f;
  output clkf;
  reg clkf;
  reg counter1;
  reg [1:0] counter2;
  reg [2:0] counter3;
  input reset_L;
  assign _09_[0] = counter3[0] & counter3[1];
  assign _08_[3] = _09_[0] & counter3[2];
  assign _13_[0] = _08_[3] ? 1'h0 : _08_[0];
  assign _13_[1] = _08_[3] ? 1'h0 : _08_[1];
  assign _13_[2] = _08_[3] ? 1'h0 : _08_[2];
  assign _05_[0] = reset_L ? _13_[0] : 1'h0;
  assign _05_[1] = reset_L ? _13_[1] : 1'h0;
  assign _05_[2] = reset_L ? _13_[2] : 1'h0;
  assign _14_[0] = _07_[2] ? 1'h0 : _07_[0];
  assign _14_[1] = _07_[2] ? 1'h0 : _07_[1];
  assign _04_[0] = reset_L ? _14_[0] : 1'h0;
  assign _04_[1] = reset_L ? _14_[1] : 1'h0;
  assign _15_ = counter1 ? 1'h0 : _06_[0];
  assign _03_ = reset_L ? _15_ : 1'h0;
  assign _16_ = _08_[3] ? _12_ : clkf;
  assign _02_ = reset_L ? _16_ : 1'h1;
  assign _17_ = _07_[2] ? _11_ : clk2f;
  assign _00_ = reset_L ? _17_ : 1'h1;
  assign _18_ = counter1 ? _10_ : clk4f;
  assign _01_ = reset_L ? _18_ : 1'h1;
  assign _10_ = ~clk4f;
  assign _11_ = ~clk2f;
  assign _12_ = ~clkf;
  always @(posedge clk16f)
      clk4f <= _01_;
  always @(posedge clk16f)
      clk2f <= _00_;
  always @(posedge clk16f)
      clkf <= _02_;
  always @(posedge clk16f)
      counter1 <= _03_;
  always @(posedge clk16f)
      counter2[0] <= _04_[0];
  always @(posedge clk16f)
      counter2[1] <= _04_[1];
  always @(posedge clk16f)
      counter3[0] <= _05_[0];
  always @(posedge clk16f)
      counter3[1] <= _05_[1];
  always @(posedge clk16f)
      counter3[2] <= _05_[2];
  assign _07_[0] = counter2[0] ^ 1'h1;
  assign _08_[1] = counter3[1] ^ counter3[0];
  assign _08_[0] = counter3[0] ^ 1'h1;
  assign _08_[2] = counter3[2] ^ _09_[0];
  assign _07_[2] = counter2[1] & counter2[0];
  assign _06_[0] = 1'h1 ^ counter1;
  assign _07_[1] = counter2[1] ^ counter2[0];
endmodule

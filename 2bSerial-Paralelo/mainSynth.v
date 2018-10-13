/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-10 -O2 -fdebug-prefix-map=/build/yosys-0DEyT5/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

module serialParaleloEst(clk16, reset16, serial, outParalelo);
  wire [1:0] _00_;
  wire [8:0] _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  input clk16;
  wire [1:0] i;
  output [8:0] outParalelo;
  input reset16;
  input [1:0] serial;
  NOT _18_ (
    .A(outParalelo[8]),
    .Y(_02_)
  );
  NAND _19_ (
    .A(i[1]),
    .B(i[0]),
    .Y(_03_)
  );
  NAND _20_ (
    .A(_03_),
    .B(reset16),
    .Y(_04_)
  );
  NOR _21_ (
    .A(_04_),
    .B(_02_),
    .Y(_01_[8])
  );
  NOT _22_ (
    .A(reset16),
    .Y(_05_)
  );
  NOT _23_ (
    .A(i[0]),
    .Y(_06_)
  );
  NOT _24_ (
    .A(i[1]),
    .Y(_07_)
  );
  NOR _25_ (
    .A(_07_),
    .B(_06_),
    .Y(_08_)
  );
  NOR _26_ (
    .A(_08_),
    .B(outParalelo[0]),
    .Y(_09_)
  );
  NOR _27_ (
    .A(_09_),
    .B(_05_),
    .Y(_01_[0])
  );
  NOR _28_ (
    .A(_08_),
    .B(outParalelo[1]),
    .Y(_10_)
  );
  NOR _29_ (
    .A(_10_),
    .B(_05_),
    .Y(_01_[1])
  );
  NOR _30_ (
    .A(_08_),
    .B(outParalelo[2]),
    .Y(_11_)
  );
  NOR _31_ (
    .A(_11_),
    .B(_05_),
    .Y(_01_[2])
  );
  NOR _32_ (
    .A(_08_),
    .B(outParalelo[3]),
    .Y(_12_)
  );
  NOR _33_ (
    .A(_12_),
    .B(_05_),
    .Y(_01_[3])
  );
  NOR _34_ (
    .A(_08_),
    .B(outParalelo[4]),
    .Y(_13_)
  );
  NOR _35_ (
    .A(_13_),
    .B(_05_),
    .Y(_01_[4])
  );
  NOR _36_ (
    .A(_08_),
    .B(outParalelo[5]),
    .Y(_14_)
  );
  NOR _37_ (
    .A(_14_),
    .B(_05_),
    .Y(_01_[5])
  );
  NOR _38_ (
    .A(_08_),
    .B(outParalelo[6]),
    .Y(_15_)
  );
  NOR _39_ (
    .A(_15_),
    .B(_05_),
    .Y(_01_[6])
  );
  NOR _40_ (
    .A(_08_),
    .B(outParalelo[7]),
    .Y(_16_)
  );
  NOR _41_ (
    .A(_16_),
    .B(_05_),
    .Y(_01_[7])
  );
  NOR _42_ (
    .A(i[0]),
    .B(_05_),
    .Y(_00_[0])
  );
  NOR _43_ (
    .A(i[1]),
    .B(i[0]),
    .Y(_17_)
  );
  NOR _44_ (
    .A(_17_),
    .B(_04_),
    .Y(_00_[1])
  );
  DFF _45_ (
    .C(clk16),
    .D(_01_[0]),
    .Q(outParalelo[0])
  );
  DFF _46_ (
    .C(clk16),
    .D(_01_[1]),
    .Q(outParalelo[1])
  );
  DFF _47_ (
    .C(clk16),
    .D(_01_[2]),
    .Q(outParalelo[2])
  );
  DFF _48_ (
    .C(clk16),
    .D(_01_[3]),
    .Q(outParalelo[3])
  );
  DFF _49_ (
    .C(clk16),
    .D(_01_[4]),
    .Q(outParalelo[4])
  );
  DFF _50_ (
    .C(clk16),
    .D(_01_[5]),
    .Q(outParalelo[5])
  );
  DFF _51_ (
    .C(clk16),
    .D(_01_[6]),
    .Q(outParalelo[6])
  );
  DFF _52_ (
    .C(clk16),
    .D(_01_[7]),
    .Q(outParalelo[7])
  );
  DFF _53_ (
    .C(clk16),
    .D(_01_[8]),
    .Q(outParalelo[8])
  );
  DFF _54_ (
    .C(clk16),
    .D(_00_[0]),
    .Q(i[0])
  );
  DFF _55_ (
    .C(clk16),
    .D(_00_[1]),
    .Q(i[1])
  );
endmodule

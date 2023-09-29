pragma circom 2.1.6;

template Multiplicador() {
  signal input a;
  signal input b;
  signal output c;

  c <== a*b;
}

component main = Multiplicador();
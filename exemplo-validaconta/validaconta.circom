pragma circom 2.1.6;

template ValidaConta() {
  signal input agencia;
  signal input conta;
  signal input validador;
  
  var delta = (conta*agencia);
  log("delta", delta);
  validador === delta;
}

component main {public [validador]} = ValidaConta();
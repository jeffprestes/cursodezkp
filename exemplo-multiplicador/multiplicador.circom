pragma circom 2.1.6;

template Multiplicador() {
  signal input a;
  signal input b;
  signal input c;
  signal input deltaBier;  
 
  /*
  circom allows programmers to define the constraints that define the arithmetic circuit. 
  All constraints must be quadratic of the form A*B + C = 0, where A, B and C are linear 
  combinations of signals. circom will apply some minor transformations on the defined constraints 
  in order to meet the format A*B + C = 0:
    - Moves from one side of the equality to the other.
    - Applications of commutativity of addition.
    - Multiplication (or division) by constants.
  */
  deltaBier === b**2-(4*a-c);
}

component main {public [deltaBier]} = Multiplicador();
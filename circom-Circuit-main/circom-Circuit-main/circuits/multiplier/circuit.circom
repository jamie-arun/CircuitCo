pragma circom 2.0.0;

/*This circuit Takes Two Inputs(a,b) And Give Specefic Output(q)*/  

template Multiplier2 () {  

   // signals
      signal input a;
      signal input b;


  // intermediate output 
      signal x;
      signal y;


  // output of complete circuit
      signal output q;

      component andGate = AND();
      component notGate = NOT();
      component orGate = OR();


//input for the circuit 

      andGate.a <== a;
      andGate.b <== b;
      notGate.in <== b;

      x <== andGate.out;
      y <== notGate.out;
  

      orGate.a <== x;
      orGate.b <== y;
//output

      q <== orGate.out;

   
}
// Code for AND Gate 
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
// Code for OR Gate 
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
// Code for NOT Gate
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();

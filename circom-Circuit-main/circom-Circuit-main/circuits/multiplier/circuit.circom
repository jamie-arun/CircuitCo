pragma circom 2.0.0;

/*This circuit Takes Two Inputs(a,b) And Give Specefic Output(q)*/  

template Multiplier2 () {  

   // signals
      signal input a;
      signal input b;


  
      signal x;
      signal y;



      signal output q;

      component andGate = AND();
      component notGate = NOT();
      component orGate = OR();


//input

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
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
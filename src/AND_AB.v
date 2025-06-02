module AND_AB (
  input wire [7:0] entradaA, entradaB,
  output wire [7:0] salida_and
);

  assign salida_and = entradaA & entradaB;

endmodule

module or_bits (
  input wire [7:0] entradaA, entradaB,
  output wire [7:0] salida_or
);

  assign salida_or = entradaA | entradaB;

endmodule

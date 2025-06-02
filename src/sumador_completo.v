module sumador_completo (
  input wire bit1, bit2, acarreo_in,
  output wire acarreo_out, suma_bit
);

  wire propaga, genera;  // señales internas de propagación y generación de acarreo
  
  assign propaga = bit1 ^ bit2;        // Propagación del acarreo entre las entradas
  assign genera  = bit1 & bit2;        // Generación de acarreo por las entradas
  
  assign suma_bit   = propaga ^ acarreo_in;                     // Resultado de la suma de bits
  assign acarreo_out = genera | (propaga & acarreo_in);        // Acarreo de salida

endmodule

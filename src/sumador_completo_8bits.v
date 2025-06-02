module sumador_completo_8bits (
  input wire acarreo_entrada,
  input wire [7:0] entradaA, entradaB,
  output wire [7:0] suma_salida,
  output wire acarreo_salida
);

  wire [6:0] acarreos_intermedios;  // acarreos entre las etapas del sumador

  sumador_completo bit0(.bit1(entradaA[0]), .bit2(entradaB[0]), .acarreo_in(acarreo_entrada), .suma_bit(suma_salida[0]), .acarreo_out(acarreos_intermedios[0]));
  sumador_completo bit1(.bit1(entradaA[1]), .bit2(entradaB[1]), .acarreo_in(acarreos_intermedios[0]), .suma_bit(suma_salida[1]), .acarreo_out(acarreos_intermedios[1]));
  sumador_completo bit2(.bit1(entradaA[2]), .bit2(entradaB[2]), .acarreo_in(acarreos_intermedios[1]), .suma_bit(suma_salida[2]), .acarreo_out(acarreos_intermedios[2]));
  sumador_completo bit3(.bit1(entradaA[3]), .bit2(entradaB[3]), .acarreo_in(acarreos_intermedios[2]), .suma_bit(suma_salida[3]), .acarreo_out(acarreos_intermedios[3]));
  sumador_completo bit4(.bit1(entradaA[4]), .bit2(entradaB[4]), .acarreo_in(acarreos_intermedios[3]), .suma_bit(suma_salida[4]), .acarreo_out(acarreos_intermedios[4]));
  sumador_completo bit5(.bit1(entradaA[5]), .bit2(entradaB[5]), .acarreo_in(acarreos_intermedios[4]), .suma_bit(suma_salida[5]), .acarreo_out(acarreos_intermedios[5]));
  sumador_completo bit6(.bit1(entradaA[6]), .bit2(entradaB[6]), .acarreo_in(acarreos_intermedios[5]), .suma_bit(suma_salida[6]), .acarreo_out(acarreos_intermedios[6]));
  sumador_completo bit7(.bit1(entradaA[7]), .bit2(entradaB[7]), .acarreo_in(acarreos_intermedios[6]), .suma_bit(suma_salida[7]), .acarreo_out(acarreo_salida));

endmodule

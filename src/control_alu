module control_alu (
  input wire [7:0] datoA, datoB,
  input wire [2:0] control_alu,
  input wire [2:0] movimientos_izq, movimientos_der,
  output wire [7:0] resultado_alu,
  output wire [3:0] flags_alu
);

  wire acarreo_flag;
  wire [7:0] suma_resta_res;
  reg [7:0] salida;
  wire [7:0] and_res, or_res;
  wire [7:0] despl_izq, despl_der;
  wire [3:0] flags_salida;

  SumaResta suma_resta_inst(
    .A(datoA),
    .B(datoB),
    .ALU0(control_alu[0]),
    .CarryOut(acarreo_flag),
    .SumRest(suma_resta_res)
  );

  AND_AB and_inst(
    .A(datoA),
    .B(datoB),
    .and_ab(and_res)
  );

  OR_AB or_inst(
    .A(datoA),
    .B(datoB),
    .or_ab(or_res)
  );

  SHIFT_LEFT shift_izq(
    .sumrest(suma_resta_res),
    .MovL(movimientos_izq),
    .Shift_Left(despl_izq)
  );

  SHIFT_RIGHT shift_der(
    .sumrest(suma_resta_res),
    .MovR(movimientos_der),
    .Shift_Right(despl_der)
  );

  always @(*) begin
    case(control_alu)
      3'd0: salida = suma_resta_res;     //  suma
      3'd1: salida = suma_resta_res;     // resta
      3'd2: salida = and_res;             // AND
      3'd3: salida = or_res;              // OR
      3'd4: salida = despl_der;           // Desplazamiento derecha (suma)
      3'd5: salida = despl_der;           // Desplazamiento derecha (resta)
      3'd6: salida = despl_izq;           // Desplazamiento izquierda (suma)
      3'd7: salida = despl_izq;           // Desplazamiento izquierda (resta)
    endcase
  end

  assign resultado_alu = salida;

  ALU_FLAGS flags_inst(
    .a7(datoA[7]),
    .b7(datoB[7]),
    .sumrest7(suma_resta_res[7]),
    .result(salida),
    .carry(acarreo_flag),
    .ALU(control_alu),
    .ALU_Flags(flags_salida)
  );

  assign flags_alu = flags_salida;

endmodule

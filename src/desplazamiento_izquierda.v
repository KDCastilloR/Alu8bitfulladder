module desplazamiento_izquierda (
  input wire [7:0] valor_in,
  input wire [2:0] cant_mov,
  output reg [7:0] valor_desplazado
);

  always @(*) begin
    case (cant_mov)
      3'd0: valor_desplazado = valor_in;
      3'd1: valor_desplazado = {valor_in[6:0], 1'b0};
      3'd2: valor_desplazado = {valor_in[5:0], 2'b00};
      3'd3: valor_desplazado = {valor_in[4:0], 3'b000};
      3'd4: valor_desplazado = {valor_in[3:0], 4'b0000};
      3'd5: valor_desplazado = {valor_in[2:0], 5'b00000};
      3'd6: valor_desplazado = {valor_in[1:0], 6'b000000};
      3'd7: valor_desplazado = {valor_in[0], 7'b0000000};
      default: valor_desplazado = valor_in;
    endcase
  end

endmodule

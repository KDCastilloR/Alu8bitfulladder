module desplazamiento_derecha (
  input wire [7:0] valor_in,
  input wire [2:0] cant_mov,
  output reg [7:0] valor_desplazado
);

  always @(*) begin
    case (cant_mov)
      3'd0: valor_desplazado = valor_in;
      3'd1: valor_desplazado = {1'b0, valor_in[7:1]};
      3'd2: valor_desplazado = {2'b00, valor_in[7:2]};
      3'd3: valor_desplazado = {3'b000, valor_in[7:3]};
      3'd4: valor_desplazado = {4'b0000, valor_in[7:4]};
      3'd5: valor_desplazado = {5'b00000, valor_in[7:5]};
      3'd6: valor_desplazado = {6'b000000, valor_in[7:6]};
      3'd7: valor_desplazado = {7'b0000000, valor_in[7]};
      default: valor_desplazado = valor_in;
    endcase
  end

endmodule

module banderas_alu (
  input wire bit7_a, bit7_b, bit7_sumrest,
  input wire [7:0] resultado,
  input wire acarreo,
  input wire [2:0] alu_ctrl,
  output reg [3:0] flags_out
);

  reg flag_carry, flag_overflow, flag_zero, flag_negative;

  always @(*) begin
    flag_carry = acarreo;
    // Overflow detection (para suma y resta)
    flag_overflow = (alu_ctrl == 3'd0 || alu_ctrl == 3'd1) && ((bit7_a & bit7_b & ~bit7_sumrest) | (~bit7_a & ~bit7_b & bit7_sumrest));
    flag_zero = (resultado == 8'b0);
    flag_negative = resultado[7];

    flags_out = {flag_carry, flag_overflow, flag_zero, flag_negative};
  end

endmodule

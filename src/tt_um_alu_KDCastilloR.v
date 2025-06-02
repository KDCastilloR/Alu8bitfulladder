module tt_um_alu_KDCastilloR (
    input        clk,
    input        rst_n,    // Reset activo bajo
    input        ena,
    input  [7:0] ui_in,
    output [7:0] uo_out,
    input  [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe
);

    // Señales internas
    wire btnC;            // Botón central para reset (activo alto)
    wire [15:0] sw;       // Switches de entrada (16 bits)
    wire [15:0] led;      // LEDs de salida (16 bits)
    
    // Registros para operandos A y B
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] salida;
    wire [3:0] flags;
    wire Sa, Sb;

    // Mapear entradas de switches concatenando uio_in y ui_in
    assign sw = {uio_in, ui_in};
    assign btnC = ~rst_n;      // reset activo bajo, btnC activo alto

    // Señales para cargar operandos A y B desde switches
    assign Sa = sw[11];
    assign Sb = sw[12];

    always @(posedge clk or posedge btnC) begin
        if (btnC) begin
            a <= 8'd0;
            b <= 8'd0;
        end else if (ena) begin
            if (Sa) a <= sw[7:0];
            if (Sb) b <= sw[7:0];
        end
    end

    // Instanciar la ALU personalizada
    control_alu ALU (
        .datoA(a),
        .datoB(b),
        .control_alu(sw[10:8]),
        .movimientos_izq(sw[15:13]),
        .movimientos_der(sw[15:13]),
        .resultado_alu(salida),
        .flags_alu(flags)
    );

    // Mostrar resultados en LEDs
    assign led[7:0]   = salida;       // Resultado ALU
    assign led[10:8]  = sw[10:8];     // Código de operación (ALU control)
    assign led[15:12] = flags;        // Flags: Carry, Overflow, Zero, Negative
    assign led[11]    = 1'b0;         // No usado

    // Salidas hacia los pines externos
    assign uo_out = led[7:0];
    assign uio_out = led[15:8];
    assign uio_oe  = 8'b11111111;     // Configurar uio como salida

endmodule

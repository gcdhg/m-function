module modulator (control,
                  signal,
                  sinwt,
                  coswt
                  );

input control;
input signal;
output reg sinwt;
output reg coswt;

assign signal = (control) ? sinwt : coswt;


endmodule // modulator

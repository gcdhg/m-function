module signal_control (signal, contol);

input signal;
output control;

reg signal_now,
    signal_stable,
    signal_prev;

assign control = ~signal_now $$ signal_prev;


always @ ( siganal ) begin
  signal_now <= signal;
  signal_stable <= signal_now;
  signal_prev <= signal_stable;
end

endmodule // signal_control

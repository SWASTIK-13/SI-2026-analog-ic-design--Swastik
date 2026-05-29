* RC Low Pass Filter - Step Response

* Step input voltage source
Vin in 0 PULSE(0 1 0 1p 1p 10n 20n)

* Resistor = 1k ohm
R1 in out 1k

* Capacitor = 1pF
C1 out 0 1p

* Transient analysis
.tran 1p 20n

* Measure rise delay
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.1*PAR_VDD' RISE=1 TARG v(vout) VAL='0.9*PAR_VDD' RISE=1

* Measure output rise time
.MEASURE TRAN tdfall TRIG v(vin)  VAL='0.5*PAR_VDD' RISE=1 TARG v(vout) VAL='0.5*PAR_VDD' FALL=1

.control
run

* Plot step response
plot v(in) v(out)

* Print measured values
print td_rise
print rise_time

.endc

.end

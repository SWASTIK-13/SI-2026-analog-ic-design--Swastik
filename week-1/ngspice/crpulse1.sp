Title: CR Step response

* This is netlist for RC circuit 
*R1     n1      n2      Res-in-ohms
C1      vin     vout    50p
R1      vout    0       1e3

*Vpulse n1      n2      PULSE v1 v2 td tr tf pw per
Vpulse  vin     0       PULSE 0 5 2n 10p 10p 10n 20n

.MEASURE TRAN tr1090 TRIG v(vout) VAL=0.5 RISE=1 TARG v(vout) VAL=4.5 RISE=1

.MEASURE TRAN tfall TRIG v(vout) VAL=0.5 FALL=1 TARG v(vout) VAL=4.5 FALL=1

.MEASURE TRAN vavg AVG v(vout) FROM=250n TO=300n

* Transient analysis
*.TRAN step-size total-sim-time
.TRAN 1p 500n

* Control script
.control
RUN
PLOT v(vin) v(vout)

.endc

.end


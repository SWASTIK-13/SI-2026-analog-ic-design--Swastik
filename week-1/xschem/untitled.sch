v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -80 -70 -80 {lab=vin1}
N -10 -80 20 -80 {lab=vin2}
N -200 -80 -200 -60 {lab=vin}
N -200 -80 -160 -80 {lab=vin}
N 100 -80 110 -80 {lab=vin}
N 150 -70 150 20 {lab=GND}
N 300 -70 300 20 {lab=GND}
N -220 -390 -220 -310 {lab=vin}
N -220 -390 -120 -390 {lab=vin}
N -120 -390 -120 -350 {lab=vin}
N -220 -250 -220 -160 {lab=GND}
N -220 -160 -120 -160 {lab=GND}
N -120 -170 -120 -160 {lab=GND}
N -120 -280 -120 -260 {lab=vref}
N -60 -280 -60 -260 {lab=vref}
N -120 -280 -60 -280 {lab=vref}
N -120 -290 -120 -280 {lab=vref}
N -60 -200 -60 -170 {lab=GND}
N -120 -170 -60 -170 {lab=GND}
N -120 -200 -120 -170 {lab=GND}
N -120 -160 -120 -140 {lab=GND}
N 100 -340 130 -340 {lab=vin}
N 190 -340 220 -340 {lab=vout}
N 100 -340 100 -250 {lab=vin}
N 100 -250 130 -250 {lab=vin}
N 220 -340 220 -250 {lab=vout}
N 190 -250 220 -250 {lab=vout}
N -60 -280 -10 -280 {lab=vref}
N -10 -280 -10 -120 {lab=vref}
N -10 -120 110 -120 {lab=vref}
N 100 -250 100 -80 {lab=vin}
N 80 -80 100 -80 {lab=vin}
N 150 -160 150 -130 {lab=vout}
N 220 -160 300 -160 {lab=vout}
N 300 -160 300 -130 {lab=vout}
N 220 -250 220 -160 {lab=vout}
N 150 -160 220 -160 {lab=vout}
N -200 -0 -200 40 {lab=GND}
C {vsource.sym} -200 -30 0 0 {name=Vmic value="0.6 AC=1" savecurrent=false}
C {res.sym} -130 -80 1 0 {name=Rmic
value=330
footprint=1206
device=resistor
m=1}
C {res.sym} 50 -80 1 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {capa.sym} -40 -80 1 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -220 -280 0 0 {name=V2 value=2.5 savecurrent=false}
C {vcvs_limit.sym} 150 -100 0 0 {name=E1 gain=10e5 }
C {capa.sym} 300 -100 2 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -60 -230 0 0 {name=C3
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 150 20 0 0 {name=l1 lab=GND}
C {gnd.sym} 300 20 0 0 {name=l2 lab=GND}
C {res.sym} -120 -320 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} -120 -230 2 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} 160 -340 1 0 {name=C4
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -120 -140 0 0 {name=l3 lab=GND}
C {gnd.sym} -200 40 0 0 {name=l4 lab=GND}
C {res.sym} 160 -250 1 0 {name=R1
value=300k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -190 -80 1 0 {name=p1 sig_type=std_logic lab=vin
}
C {lab_pin.sym} -210 -390 1 0 {name=p2 sig_type=std_logic lab=vin
}
C {lab_pin.sym} 250 -160 1 0 {name=p3 sig_type=std_logic lab=vout

}
C {lab_pin.sym} 90 -120 1 0 {name=p4 sig_type=std_logic lab=vref
}
C {lab_pin.sym} 100 -80 3 0 {name=p5 sig_type=std_logic lab=vin
}
C {lab_pin.sym} -80 -80 1 0 {name=p6 sig_type=std_logic lab=vin1
}
C {lab_pin.sym} 0 -80 1 0 {name=p7 sig_type=std_logic lab=vin2
}
C {simulator_commands_shown.sym} 420 -230 0 0 {name=NGSPICE1 only_toplevel=true
value="
.param temp=27
.control
save all
op
ac dec 100 1 100meg

let voutdb = vdb(vout)
let voutabs = abs(vout)

meas ac vout_1k find voutabs at=1k
meas ac voutdb_1k find voutdb at=1k

let voutm3db = voutdb_1k - 3.0

meas ac fp3db WHEN voutdb=voutm3db fall=last
meas ac f23db WHEN voutdb=voutm3db rise=1

write
plot v(vout)

.endc"}

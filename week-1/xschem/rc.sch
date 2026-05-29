v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 -30 20 -20 {lab=Vout}
N -20 -30 20 -30 {lab=Vout}
N 20 -30 50 -30 {lab=Vout}
N 20 40 20 60 {lab=ref}
N -100 -30 -80 -30 {lab=#net1}
C {res.sym} -50 -30 1 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 20 10 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {opin.sym} 50 -30 0 0 {name=p2 lab=Vout
}
C {iopin.sym} 20 60 1 0 {name=p3 lab=ref
}
C {ipin.sym} -100 -30 0 0 {name=p1 lab=Vin}

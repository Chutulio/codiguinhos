%% Nodal 1
clear all
close all
clc
E1 = 100
[E2(1), E2(2)] = pol2cart(deg2rad(30),100);
E2 = E2(1) + i*E2(2)
Z = 5i
I = (E1-E2)/Z
S1 = E1*-conj(I)
S2 = E2*conj(I)
Sz = S1+S2
%% Nodal 2
clear all
close all
clc

Vh = 13800
Vl = 220
n = 13800/220
Zl = 500
Zh = 500*n^2
P = 150e3
pc = Vl^2/Zl

Ibaseh = P/Vh
Ipuh = 1
Ibasel = P/Vl
Zbasel = Vl/Ibasel
Zpul = Zl/Zbasel
Zbaseh = Vh/Ibaseh
Zpuh = Zh/Zbaseh

pcpu=P/(Ipuh^2*Zpuh);


%% Nodal 3
clear all
close all
clc

Pb = 50e6
Sn1 = 41.5e6
Sn2 = 33e6
Sn3 = 24e6
X1 = 5.5/100
X2 =7/100
X3 =5/100
Vb1 = 230e3
Vb2 = Vb1/(138e3/69e3)
Vb4 = Vb2/(69e3/13.8e3)
Vb3 = Vb2/(69e3/34.5e3)
Zb1 = Vb1^2/Pb
Ib1 = Pb/Vb1/(3^(1/2))
Zb2 = Vb2^2/Pb
Ib2 = Pb/Vb2/(3^(1/2))
Zb3 = Vb3^2/Pb
Ib3 = Pb/Vb3/(3^(1/2))
Zb4 = Vb4^2/Pb
Ib4 = Pb/Vb4/(3^(1/2))

ZLtapu = 150*(0.12+i*0.92)/Zb2
ZLtbpu = 230*(0.19+i*1.84)/Zb3

ZT1 = X1*(Pb/Sn1)*(138e3/Vb1)^2
ZT2 = X2*(Pb/Sn2)*(69e3/Vb2)^2
ZT3 = X3*(Pb/Sn3)*(69e3/Vb2)^2
%% Nodal 3
clear all 
close all 
clc
Y = [-0.8-4-5,0,4,5;0,-0.8-2.5-5,2.5,5;4,2.5,-4-8-2.5-.8,8;5,5,8,-5-8-5]*i
Z = inv(Y)
I = [1.2;5;-6;0]   
V = Z*I

Y1 = [-0.8-4-5,0,4,5 ; 0,-0.8-2.5-5,2.5,5 ; 4,2.5,-4-2.5-.8,0 ; 5,5,0,-5-5]*i

Y2 = [-0.8-4-5,0,4,5,0.8 ; 0,-0.8-2.5-5,2.5,5,0.8 ; 4,2.5,-4-8-2.5-.8,8,0.8 ; 5,5,8,-5-8-5,0 ; 0.8,0.8,0.8,0,-0.8-0.8-0.8]*i

%% Nodal 4
clear all
close all
clc

Pb = 100e6
T1p = 138e3
T1s = 69e3
S1 = 41.5e6
X1 = 5.5/100
T2p = 69e3
T2s = 13.8e3
S2 = 33e6
X2 = 7/100
T3p = 69e3
T3s = 34.5e3
S3 = 24e6
X3 = 5/100

Vb1 = 138e3
Vb2 = Vb1/(T1p/T1s)
Vb3 = Vb2/(T2p/T2s)
Vb4 = Vb2/(T3p/T3s)
Ib1 = Pb/Vb1/(3^(1/2))
Ib2 = Pb/Vb2/(3^(1/2))
Ib3 = Pb/Vb3/(3^(1/2))
Ib4 = Pb/Vb4/(3^(1/2))
Zb1 = Vb1^2/Pb
Zb2 = Vb2^2/Pb
Zb3 = Vb3^2/Pb
Zb4 = Vb4^2/Pb

ZLTa = 30*(0.12+i*0.92)/Zb2
ZLTb = 10*(0.19+i*1.84)/Zb4

ZT1 = (X1*(Pb/S1)*(T1p/Vb1)^2)*i
ZT2 = (X2*(Pb/S2)*(T2p/Vb2)^2)*i
ZT3 = (X3*(Pb/S3)*(T3p/Vb2)^2)*i
Zf1 = i*0.1
Zf2 = i*1e12

YLTa = 1/ZLTa
YLTb = 1/ZLTb

YT1 = 1/ZT1
YT2 = 1/ZT2
YT3 = 1/ZT3
Yf1 = 1/Zf1
Yf2 = 1/Zf2

I1 = 1/Zf1

I6 = (10e6/Pb)/(34.5e3/Vb4);
[I6(1), I6(2)] = pol2cart(deg2rad(154.158),I6);
I6 = I6(1) + i*I6(2)

I = [I1;0;0;0;0;I6]
%Falta matriz de admitância, Matriz de impedância, vetor de tensão
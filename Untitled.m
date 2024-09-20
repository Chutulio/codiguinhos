clear all
close all
clc

nsb = 16;
nb = 10;
seq = randi([0,1],1,nb);
A = 5;

%Parte 1
snrz = A*(reshape(repmat(seq,nsb,1),1,nsb*nb));
SNR = -3;
srec = awgn(snrz,SNR);
lambda =0;
seqbr = sum(reshape(srec,nsb,nb))>lambda;
subplot (4,1,1)
stem(seq)
subplot (4,1,2)
stem(seqbr)
subplot(4,1,3)
plot(snrz)
subplot(4,1,4)
plot(srec)
seqbt = logical(seq);
n=biterr(seqbt,seqbr)
sinal1 = snrz + srec;
figure(2)
plot(sinal1)
potsinal = mean(snrz.^2) %Potencia do sinal
potruido = mean(srec.^2) %Potencia do ruído
SNR = 10 * log10(potsinal/potruido)
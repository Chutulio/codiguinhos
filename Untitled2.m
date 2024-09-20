%Gerando seq de bits
Nb = 9000; %Numero de bits
nab = 16; %Numero de amostras por bit
Ns = nab*Nb; %Numero total de amostras
Rb = 1000; %Taxa de transmissão
Fs = nab*Rb; %Frequencia de amostragem
Ts = 1/Fs; %Período de amostragem
Ti = 0; %Instante inicial de transmissão
Tf = Nb/Rb; %Instante final de transmissão
t = Ti:Ts:Tf-Ts; %Vetor tempo
df = Fs/Ns; % Delta de frequencia, a diferença de uma frequencia para a proxima
f = -Fs/2:df:Fs/2 - df; %Vetor frequencia
sbits = randi([0,1],1,Nb); %Gerando os bits
%Reshape pega a matriz e transcreve em um vetor só
snrzu = reshape(repmat(sbits,nab,1),1,Ns);
snrzb = 2*snrzu-1;
fc1 = ones(1,nab); %Filtro casado do 1
fc2 = -ones(1,nab); %Filtro casado do 0
% Passagem pelo canal
SNR = -3;
sinalrx = awgn(snrzb,SNR); %função que embute um ruido

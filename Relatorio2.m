clc
clear all
close all
N = 10000;
%NRZ unipolar
sb = round(rand(1,N));
nab = 8;
A = 1;
snrz = A*(reshape(repmat(sb,nab,1),1,nab*length(sb)));
subplot (4,1,1);
plot(snrz);
psnrz = mean(snrz.^2)


%Alterar o vetor para 1 e -1 alternado
sb2=zeros(1,length(sb));
flag=1;                  %Marcar se é 1 ou -1
for b = 1:length(sb)     %Faz o código rodar de 1 até o número de bits
    if sb(b)==1          %Se encontrar Bit 1 passa
        if flag ==1;     %Se tiver que ser 1, troca pra 1
            sb2(b)=1;
           flag =-1;     %O próximo que encontrar tem que ser -1
        else             %Se tiver que ser -1, troca pra -1
            sb2(b)=-1;
            flag=1;      %O próximo que encontrar tem que ser 1
        end
    end
end

%NRZ bipolar
subplot(4,1,2);
snrzb = 2*snrz - A;
plot(snrzb);
psnrzb = mean(snrzb.^2)

snrz2= A*(reshape(repmat(sb2,nab,1),1,nab*length(sb2)));
%srz bipolar
bit1= [1 1 1 1 0 0 0 0];
srz2 = snrz2.*repmat(bit1,1,N);
subplot(4,1,3);
plot(srz2)
psrz2 = mean(srz2.^2)

%srz unipolar
bit1= [1 1 1 1 0 0 0 0];
srz = snrz.*repmat(bit1,1,N);
subplot(4,1,4);
plot(srz)
psrz = mean(srz.^2)

%manchester
figure(2)
bit2= [1 1 1 1 -1 -1 -1 -1];
manch= snrzb.*repmat(bit2,1,N);
plot(manch)
pmanch = mean(manch.^2)

%4-PAM
sb3=zeros(1,length(sb));
flag = 1;
for i=1:length(sb);
    if (sb(flag)==0)&&(sb(flag+1)==0);
        sb3(flag)= -1.5*A;
        sb3(flag+1)= -1.5*A;
    end
    if (sb(flag)==0)&& (sb(flag+1)==1);
        sb3(flag)= -0.5*A;
        sb3(flag+1)= -0.5*A;
    end
    if (sb(flag)==1)&& (sb(flag+1)==0);
        sb3(flag)= 0.5*A;
        sb3(flag+1)= 0.5*A;
    end 
    if (sb(flag)==1)&& (sb(flag+1)==1);
        sb3(flag)= 1.5*A;
        sb3(flag+1)= 1.5*A;
    end
    if flag + 2 >= length(sb);
        break
    end
    flag = flag+2;
end

figure(3)
fpam = A*(reshape(repmat(sb3,nab,1),1,nab*length(sb)));
subplot(2,1,1);
plot(fpam)
pfpam = mean(fpam.^2)

%8-PAM
flag = 1;
for i=1:length(sb);
    if (sb(flag)==0)&&(sb(flag+1)==0)&& (sb(flag+2)==0);
        sb3(flag)= -3.5*A;
        sb3(flag+1)= -3.5*A;
        sb3(flag+2)= -3.5*A;
    end
    if (sb(flag)==0)&& (sb(flag+1)==0)&& (sb(flag+2)==1);
        sb3(flag)= -2.5*A;
        sb3(flag+1)= -2.5*A;
        sb3(flag+2)= -2.5*A;
    end
    if (sb(flag)==0)&& (sb(flag+1)==1)&& (sb(flag+2)==0);
        sb3(flag)= -1.5*A;
        sb3(flag+1)= -1.5*A;
        sb3(flag+2)= -1.5*A;
    end 
    if (sb(flag)==0)&& (sb(flag+1)==1)&& (sb(flag+2)==1);
        sb3(flag)= -0.5*A;
        sb3(flag+1)= -0.5*A;
        sb3(flag+2)= -0.5*A;
    end
    if (sb(flag)==1)&& (sb(flag+1)==0)&& (sb(flag+2)==0);
        sb3(flag)= 0.5*A;
        sb3(flag+1)= 0.5*A;
        sb3(flag+2)= 0.5*A;
    end
    if (sb(flag)==1)&& (sb(flag+1)==0)&& (sb(flag+2)==1);
        sb3(flag)= 1.5*A;
        sb3(flag+1)= 1.5*A;
        sb3(flag+2)= 1.5*A;
    end
    if (sb(flag)==1)&& (sb(flag+1)==1)&& (sb(flag+2)==0);
        sb3(flag)= 2.5*A;
        sb3(flag+1)= 2.5*A;
        sb3(flag+2)= 2.5*A;
    end
    if (sb(flag)==1)&& (sb(flag+1)==1)&& (sb(flag+2)==1);
        sb3(flag)= 3.5*A;
        sb3(flag+1)= 3.5*A;
        sb3(flag+2)= 3.5*A;
    end
    
    if flag + 3 >= length(sb);
        break
    end
    flag = flag+3;
end

epam = A*(reshape(repmat(sb3,nab,1),1,nab*length(sb)));
subplot(2,1,2);
plot(epam)
pepam = mean(epam.^2)

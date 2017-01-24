clc

% g2.py rngcom binary results for exam2
fileID = fopen('miloSAR.rnc','r')
D = fread(fileID,[2 2774],'float') 

I = D(1,:)
Q = D(2,:)
size(I)

%rI = reshape(I,146,19)
%rQ = reshape(Q,146,19)

figure
subplot(2,2,1)
plot(I)
hold on

subplot(2,2,2)
plot(Q)

fclose(fileID);



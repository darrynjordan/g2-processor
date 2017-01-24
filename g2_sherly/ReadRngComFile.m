clc

%sarsim2 ascii results for sarsim.scr settings
A = dlmread('exam2.asc',' ',1,0)

%sarsim2 binary results for sarsim.scr settings
fileID = fopen('exam2.bin','r')
B = fread(fileID,[2 inf],'unsigned char')

Bctr = B - 127

[PNo SNo] = size(B); % H5 is 19 x 292 = 5548
disp(PNo) % 2
disp(SNo) % 2774    PNo x SNo = 5548

%===============================================
%  
% % G2 binary results for exam2
fileID = fopen('exam2rco.bin','r')
C = fread(fileID,[2 2774],'unsigned char') % ctr'd at 127

Cctr = C - 127

%===============================================
 
% g2.py rngcom binary results for exam2
fileID = fopen('milo2.rnc','r')
D = fread(fileID,[2 2774],'float') 

I = D(1,:)
Q = D(2,:)
size(I)

rI = reshape(I,146,19)
rQ = reshape(Q,146,19)

figure
subplot(2,2,1)
surf(rI)
% colormap parula(15)
hold on

subplot(2,2,2)
surf(rQ)
% colormap parula(15)

%===============================================
 
% g2.py corner binary results for exam2
fileID = fopen('milo2.cor','r')
E = fread(fileID,[2 inf],'float') 

I = E(1,:)
Q = E(2,:)
size(I)

rI = reshape(I,19,146)
rQ = reshape(Q,19,146)

% figure
hold on

subplot(2,2,3)
surf(rI)
% colormap parula(15)
hold on

subplot(2,2,4)
surf(rQ)
% colormap parula(15)


fclose(fileID);



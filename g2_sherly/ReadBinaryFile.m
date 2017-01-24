clc

%sarsim2 ascii results for sarsim.scr settings
A = dlmread('exam2.asc',' ',1,0)

%sarsim2 binary results for sarsim.scr settings
fileID = fopen('exam2.bin','r');

B = fread(fileID,[2 inf],'unsigned char')

[PNo SNo] = size(B); % H5 is 19 x 292 = 5548
disp(PNo) % 2
disp(SNo) % 2774    PNo x SNo = 5548

Bctr = B - 127; % centre B around 0

figure;

subplot(1,2,1)
plot(A(:,1),'r--')
hold on
plot(B(1,:),'b--')
hold on
plot (Bctr(1,:),'g--') % SAME AS A !!! :-)

% save B as ascii
dlmwrite('exam22.asc',Bctr',' '); % Bctr' IS SAME AS A !!! :-)

%===============================================
 
Actr = A + 127; % centre A around 127

% save A as binary
fileID = fopen('exam23.bin','w'); % Save Actr' - SIMILAR TO exam22.bin but an extra ,v
fwrite(fileID, Actr');

%sarsim2 binary results for exam2
fileID = fopen('exam23.bin','r'); % SIMILAR TO exam22.bin but an extra ,v
C = fread(fileID,[2 inf],'unsigned char')

subplot(1,2,2)
plot(A(:,1),'r--')
hold on
plot (Bctr(1,:),'b--') 
hold on
plot(C(1,:),'g--')

fclose(fileID);



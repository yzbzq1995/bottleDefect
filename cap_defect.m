gOrg=dicomread('ƿ��-1(����)�󽹵�');
% gOrg=adpmedian(gOrg,7);
figure,imshow(gOrg);
gHistadj=imadjust(gOrg);
figure,imshow(gHistadj);


gROI=gOrg(857:1331,1395:1585);
gCap=gOrg(857:950,1395:1585);

gROIAdj=imadjust(gROI,[860/65535,19073/65535],[0,1],1);
figure,imshow(gROIAdj);
gCapAdj=imadjust(gCap,[860/65535,19073/65535],[0,1],4);
figure,imshow(gCapAdj);
gCapAdjComplement=imcomplement(gCapAdj);
figure,imshow(gCapAdjComplement);

figure
hCap=imhist(gCapAdjComplement,25);
uHorz=linspace(0,255,25);
bar(uHorz,hCap);
axis([0 255 0 60000]);
set(gca,'xtick',0:50:255);
set(gca,'ytick',0:20000:60000);

bCap=imbinarize(gCapAdjComplement,'global');
figure,imshow(bCap);
[cCapConn,uCapConn]=bwlabel(bCap,8);

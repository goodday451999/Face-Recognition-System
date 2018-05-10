%% Test
clc
clear all
close all
[fname, path]=uigetfile('.jpg','Provide a Face for Testing');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('Test Face');


%% Class Check
Ftest=FeatureStat(im);

%% Compare with Database
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
diff(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(diff);
if(Min<3)
m=find(diff==Min,1);
detClass=Ctrain(m);
msgbox(strcat('Detected Class=',num2str(detClass)));
else
    msgbox('This Person is not registered');
end


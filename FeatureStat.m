function [F]= FeatureStat(im)
im=double(im);
m=mean(im(:));
s=std(im(:));
F=[m s];
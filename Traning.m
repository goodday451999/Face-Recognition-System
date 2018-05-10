%% Traning
clc
clear all
close all
[fname, path]=uigetfile('.jpg','Open a Face as Input for Traning');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('Input Face');
c=input('Enter the Class');


%% Feature Extraction
F=FeatureStat(im);
try
    load db;
    F=[F c];
    db=[db;F];
    save db.mat db
catch
    db=[F c]; 
    save db.mat db
end
    

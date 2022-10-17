clc
close all;
clear all;

I = imread("Database\HC1_1.bmp");
[featureVector,hogVisualization] = extractHOGFeatures(I);
figure;
imshow(I,[]);
figure;
imshow(hogVisualization,[]);

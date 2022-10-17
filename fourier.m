clear all
close all
clc

x=imread('database\HC1_1.bmp');

figure(1); imshow(x);

y=fft2(double(x));

z=fftshift(y);
figure(2); imshow(log(abs(z)),[]);

z2=ifftshift(z);
x2=ifft2(z2);
figure(3); fig=imshow(real(x2),[]);

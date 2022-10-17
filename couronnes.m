% Hubert Konik
% approche couronnes dans Fourier

x=imread('Database/HC1_1.bmp');
figure(1); imshow(x);

y = fft2(double(x));
z = fftshift(y);
figure(2); imshow(log(abs(z)),[]);

CBL=0;
CBH=30;

ci=size(z,1)/2+1;
cj=size(z,2)/2+1;
for i=1:size(z,1)
    for j=1:size(z,2)
        [THETA,RHO]=cart2pol(j-cj,i-ci);
        if ( (RHO < CBL) || (RHO > CBH) )
            z(i,j)= 0;
        end
    end
end
figure(3); imshow(log(abs(z)),[]);

x2=ifft2(ifftshift(z));
figure(4); imshow(real(x2),[]);

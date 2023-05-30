I = imread('cameraman.tif');
figure(1)
%Ibulr4 = imgaussfilt(I,1);
%DP = fftshift(fft2(Ibulr4));
DP = fftshift(fft2(I));
imagesc(abs(DP))
axis image
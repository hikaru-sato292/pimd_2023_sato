I = imread('cameraman.tif');
figure(1)
imshow(I)

Ibulr1 = imgaussfilt(I,1);
Ibulr2 = imgaussfilt(I,2);
Ibulr3 = imgaussfilt(I,4);
Ibulr4 = imgaussfilt(I,16);

Idog1 = Ibulr1 - Ibulr2 + 128;
Idog2 = Ibulr2 - Ibulr3 + 128;
Idog3 = Ibulr3 - Ibulr4 + 128;


figure(2)
subplot(4,2,1)
imshow(Ibulr1)
subplot(4,2,2)
imshow(Ibulr2)
subplot(4,2,3)
imshow(Ibulr3)
subplot(4,2,4)
imshow(Ibulr4)

subplot(4,2,5)
imshow(Idog1)
subplot(4,2,6)
imshow(Idog2)
subplot(4,2,7)
imshow(Idog3)


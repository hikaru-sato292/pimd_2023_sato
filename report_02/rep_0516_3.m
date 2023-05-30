rgbImage = imread("peppers.png");

figure(1)
subplot(4,1,1)
imshow(rgbImage)
subplot(4,1,2)
imshow(rgbImage(:,:,1))
subplot(4,1,3)
imshow(rgbImage(:,:,2))
subplot(4,1,4)
imshow(rgbImage(:,:,3))

hsvImage = rgb2hsv(rgbImage);
figure(2)
subplot(4,1,1)
imshow(rgbImage)
subplot(4,1,2)
imshow(hsvImage(:,:,1))
subplot(4,1,3)
imshow(hsvImage(:,:,2))
subplot(4,1,4)
imshow(hsvImage(:,:,3))

%HSVの各成分のヒストグラムを描画
figure(3)
subplot(3,1,1)
imhist(hsvImage(:,:,1))
subplot(3,1,2)
imhist(hsvImage(:,:,2))
subplot(3,1,3)
imhist(hsvImage(:,:,3))

%画像の彩度を下げる
hsvImage_low_s = hsvImage;
hsvImage_low_s(:,:,2) = hsvImage(:,:,2)/2;
figure(4)
rgbImage_low_s = hsv2rgb(hsvImage_low_s);
imshow(rgbImage_low_s)

%色のしきい値処理(赤色抽出) for文より圧倒的に速い
figure(5)
channel1Min = 0.953;
channel1Max = 0.043;

BW1 = (hsvImage(:,:,1)) >= (channel1Min);
BW2 = (hsvImage(:,:,1)) <= (channel1Max);
BW_hue = BW1 | BW2;
%imshow(BW_hue)

channel2Min = 0.344;
%channel2Max = 1.000;
BW_sat = (hsvImage(:,:,2)) >= (channel2Min);

BW = BW_hue & BW_sat;

imshow(BW)

figure(6)
% *の前に.を付けると要素ごとの演算になる
maskedrgbImage = (rgbImage .* uint8(BW));
imshow(maskedrgbImage)

%赤色の領域抽出(MATLABの関数作成ツールを使用)
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.957;
channel1Max = 0.035;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.367;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = ( (hsvImage(:,:,1) >= channel1Min) | (hsvImage(:,:,1) <= channel1Max) ) & ...
    (hsvImage(:,:,2) >= channel2Min ) & (hsvImage(:,:,2) <= channel2Max) & ...
    (hsvImage(:,:,3) >= channel3Min ) & (hsvImage(:,:,3) <= channel3Max);
figure(7)
imshow(sliderBW)

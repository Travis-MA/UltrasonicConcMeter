clear
clc

img = imread('freq.JPG');
tresh = graythresh(img);
curve_img = imbinarize(img,tresh);
curve_img = curve_img(:,:,1)*1;
curve = ones(491,1);
shift = 250000;

startfreq = 400000;
endfreq = 1500000;
max = 3700;
min = 1250;
for i = 1:491
    for j = 1:243
       if curve_img(j,i)<1
           curve(i) = (243-j)/243*(3700-1250)+1250;
           break;
       end
    end
end

shift_index = ceil(491/(-startfreq+endfreq)*shift);
curve40 = curve(shift_index:end);
curve45 = curve(1:end-shift_index+1);

x1 = linspace(startfreq+shift,endfreq,491-shift_index+1);

plot(x1,curve40)
hold on
plot(x1, curve45)
hold on
plot(x1, curve40+curve45)
hold on
plot(x1, curve40+curve40)
xlabel('frequency, Hz');
ylabel('Z(w)');
title('');
grid on
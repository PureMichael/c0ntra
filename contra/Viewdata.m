[A, map] = imread('data/Boson_Capture1_1.tiff');

if ~isempty(map)
   A = ind2rgb(A,map);
else
   A = im2double(A);
end
%image(A)


A1 = A - min(min(A));


for m = 1:500:5001
    A2 = A1*m;
    figure(m)
    image(A2)
end

% figure(1)
% image(A);
% figure(2);
% image(A1);
% figure(3);
% image(A2);
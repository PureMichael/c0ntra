function [totalMin] = getMin(fileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%fileName = 'data/Boson_Capture1_1.tiff';

clip_info = imfinfo(fileName);
totalMin = inf;

for n = 1:size(clip_info,1)
       
    [frame, map] = imread(fileName,n);

    if ~isempty(map)
       frame = ind2rgb(frame,map);
    else
       frame = im2double(frame);
    end
    
    currentMin = min(min(frame));
    if currentMin < totalMin
       totalMin = currentMin;
    end
    
    
end


end


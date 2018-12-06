clear
%close all

cameraNo = [1,4];
trialNo = 1:6;
load('allMins.mat');

for j = 1:2
for k = 6
    fileName = sprintf('data/20181026_data/Boson_Capture%i_%i.tiff',cameraNo(j),trialNo(k))

    clip_info = imfinfo(fileName);
    frameGap = 500;
    frames = 1:frameGap:size(clip_info,1);
    %frames = 1:10:100;
    frameNo = length(frames);



    for n = 1:frameNo


    [frame, map] = imread(fileName,frames(n));

    if ~isempty(map)
       frame = ind2rgb(frame,map);
    else
       frame = im2double(frame);
    end
    %image(A)


    A1 = frame - minVals(1,k);

    % 
    for m = 26000:2000:28001
        A2 = A1*m;
        figure(cameraNo(j))
        if m == 26000
            subplot(frameNo,2,2*(n-1)+1)
            image(A2)
        else
            m;
            subplot(frameNo,2,2*(n-1)+2)
            image(A2)

        end
    end
    end
end
end

% figure(1)
% image(A);
% figure(2);
% image(A1);
% figure(3);
% image(A2);
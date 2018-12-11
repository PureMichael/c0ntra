%clear
close all

cameraNo = [1,4];
trialNo = 1:6;
load('allMins.mat');

for j = 2
    for k = 2
        fileName = sprintf('data/20181107_data/Boson_Capture%i_%i.tiff',cameraNo(j),trialNo(k))
        clip_info = imfinfo(fileName);
        frameGap = 500;
        frames = 1:frameGap:size(clip_info,1);
        %frames = 1:10:100;
        frameNo = length(frames);
        %frame_holder = zeros(256,320,frameNo);

        
        for n = 1:frameNo
        %for n  = 1426
            [frame, map] = imread(fileName,frames(n));
            %[frame, map] = imread(fileName,n);
            if ~isempty(map)
               frame = ind2rgb(frame,map);
            else
               frame = im2double(frame);
            end
            A1 = frame - 0.3709;
            %frame_holder(:,:,n) = A1;
            
            
            %x = 13000:1000:15001;
            for m = 14000
                A2 = A1*m;
                figure(cameraNo(j))
                subplot(round(frameNo/2),2,n)
                image(A2)
            end
        end
        %save('frame_holder.mat','frame_holder','clip_info');
    end
end

% figure(1)
% image(A);
% figure(2);
% image(A1);
% figure(3);
% image(A2);
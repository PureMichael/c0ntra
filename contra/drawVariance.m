load('frame_holder.mat');
%close all
indexx = 1:320;
indexy = 1:256;
%close(10);
avgs = zeros(length(indexy),length(indexx));
stds = zeros(length(indexy),length(indexx));
norm_stds = zeros(length(indexy),length(indexx));

for m = 1:length(indexy)
    for n = 1:length(indexx)
    strip = frame_holder(indexy(m),indexx(n),:);
    turned = permute(strip,[3 2 1]);
%     
%     figure(10);
%     hold on
%     plot(turned);
%     
%     figure(3)
%     subplot(2,2,m);
%     plot(turned);
%     
%     figure(5)
%     subplot(2,2,m);
%     plot(diff(turned));
%     
%     avgs(m) = mean(turned);
%     stds(m) = std(turned);
    figure(6)
    avgs(m,n) = mean(diff(turned));
    stds(m,n) = std(diff(turned));
    end
end


avgs;
stds;
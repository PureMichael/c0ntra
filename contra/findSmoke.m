%load('frame_holder.mat');
%close all
indexx = [126,192,35,147];
indexy = [40,47,30,213];
%close(10);
avgs = zeros(1,2*length(indexy));
stds = zeros(1,2*length(indexy));

for m = 1:length(indexy)

    strip = frame_holder(indexy(m),indexx(m),:);
    turned = permute(strip,[3 2 1]);
    figure(10);
    hold on
    plot(turned);
    
    figure(3)
    subplot(2,2,m);
    plot(turned);
    
    figure(5)
    subplot(2,2,m);
    plot(diff(turned));
    
    avgs(m) = mean(turned);
    stds(m) = std(turned);
    
    avgs(m+4) = mean(diff(turned));
    stds(m+4) = std(diff(turned));
end

avgs
stds
%min1 = min(min(stds));
min1 = stds(103,278);
max1 = max(max(stds));
norm_stds = zeros(256,320);
norm_stds_eroded = zeros(256,320);
threshold = 0;
max_overlay = max(max(frame_holder(:,:,1000)));
for n = 1:length(indexx)
    for m = 1:length(indexy)
        val = stds(m,n);
        if val > min1
            %norm_stds(m,n) = uint8(255 .* ((double(val)-min1)) ./ (max1-min1));
            norm_stds(m,n) = max_overlay;
            val;
        else 
            norm_stds(m,n) = frame_holder(m,n,1000);
        end
    end
    
    %%Remove edge noise
    if n == 1
       threshold = 0.7*sum(norm_stds(:,n)); 
       norm_stds(:,n) = frame_holder(:,n,1000); 
    else
        if sum(norm_stds(:,n)) > threshold
           norm_stds(:,n) = frame_holder(:,n,1000); 
        end
    end
end

norm_stds_eroded = norm_stds;



for k = 1:320
    for j = 1:256        
        val = norm_stds(j,k);
        if val == max_overlay
            if k == 1
                if norm_stds(j,k) ~= norm_stds(j,k+1) 
                   norm_stds_eroded(j,k) = frame_holder(j,k,1000); 
                end
            elseif k==320
                if norm_stds(j,k) ~= norm_stds(j,k-1)
                   norm_stds_eroded(j,k) = frame_holder(j,k,1000); 
                end    
            else
                if norm_stds(j,k) ~= norm_stds(j,k-1) ||norm_stds(j,k) ~= norm_stds(j,k+1) || norm_stds(j,k) ~= norm_stds(j,k-2) || norm_stds(j,k) ~= norm_stds(j,k+2)
                   norm_stds_eroded(j,k) = frame_holder(j,k,1000); 
                end 
            end
        end
    end
end

figure(4)
subplot(3,2,1)
image(14000*norm_stds);
subplot(3,2,2)
image(14000*norm_stds_eroded);

noCameras = 4;
noTrials = 6;
minVals = zeros(noCameras, noTrials);

for m = 1:noCameras
    for n = 1:noTrials
        if m == 1 || m == 4

          fileName = sprintf('data/Boson_Capture%i_%i.tiff',m,n)  
          minVals(m,n) = getMin(fileName);
            
            
        end 
    end
end

save('allMins.mat','minVals');
function [imgWatershed, imgLabel, imgLabelRGB] = myWatershed(img, numFloodSteps)

   % label description
% pixel not labeled yet:  0
% pixel extends region:  >0
% pixel is watershed:    -1 
% pixel is only padding: -2
imgLabel = zeros(size(img));

% create gradient magnitude image
img = im2double(img); % type cast to double
[imgGrMg, ~] = imgradient(img);
imgGrMg = mat2gray(imgGrMg);

% calculate stepsize
minVal = min(imgGrMg(:));
maxVal = max(imgGrMg(:));
range = maxVal-minVal;
stepSize = range/numFloodSteps;

% prepare label image for easy iteration
imgLabel = padarray(imgLabel,[1 1], -2);
imgGrMg = padarray(imgGrMg,[1 1]);

labelCounter = 0;
% increment flood level
for floodLevel = minVal:stepSize:maxVal
   
    % iterate through each image pixel
    for i = 2:size(img,1) + 1
        for j = 2:size(img,2) + 1
            
            % check if gradient value is in flood range
            if (imgGrMg(i,j) >= floodLevel) && (imgGrMg(i,j) < floodLevel+stepSize)
                
                % check if current pixel has not been assigned to any label yet
                if imgLabel(i,j) == 0
                    
                    % iterate through pixel's neighbors
                    for k = i-1:i+1
                        for l = j-1:j+1   
                            
                            % don't compare pixel to itself
                            if ~(k == i && l == j)
                                neighborLabel = imgLabel(k,l);
                                
                                % check if neighborLabel belongs to some region
                                if neighborLabel > 0
                                    % check if current label has been assigned 
                                    if (imgLabel(i,j) == 0)
                                        % assign to same label as neighbor
                                        imgLabel(i,j) = neighborLabel;
                                        
                                    % check if neighborlabel is different from another neighbor 
                                    elseif (imgLabel(i,j) ~= neighborLabel)
                                        % current pixel is watershed
                                        imgLabel(i,j) = -1;
                                    end
                                end

                            end

                        end
                    end
                    
                    % check if current pixel is still not assigned
                    if imgLabel(i,j) == 0
                        % pixel is isolated!
                        labelCounter = labelCounter + 1;
                        imgLabel(i,j) = labelCounter;
                    end
                end
            end
        end       
    end
end

imgLabel = imgLabel(2:end-1,2:end-1);
ind = imgLabel == -1;
imgLabel(ind) = max(imgLabel(:))+1;
imgLabelRGB = label2rgb(imgLabel);
imgWatershed = img;
imgWatershed(ind) = max(img(:))+1;
imgWatershed = mat2gray(imgWatershed); 
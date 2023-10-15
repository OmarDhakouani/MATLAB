function [output_img] = myErosion(img, str_element)
%MYEROSION Summary of this function goes here
%   Detailed explanation goes here

    % calculate padding size
    padSize = floor(size(str_element,1)/2)
    
    % pad image with zeros
    img_pad = padarray(img,[padSize padSize],0)
    
    % initialize array for eroded image
    output_img = zeros(size(img));
    
    % iterate through each pixel in original image
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            
            % crop image patch
            img_patch = img_pad(i:i+2*padSize,j:j+2*padSize);
            
            % part of image patch under the structuring element
            img_patch_overlay = img_patch.*str_element;
            
            % if all elements under the structuring element are 1, 
            % then assign 1
            if all(img_patch_overlay(:)==1)
                output_img(i,j) = 1;
            end
        end
    end
    
    % remove added padding
    %output_img = output_img(1+padSize:end-padSize, 1+padSize:end-padSize);
end

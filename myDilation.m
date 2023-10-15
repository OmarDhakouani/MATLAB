function [output_img] = myDilation(img, str_element)
%MYDILATION Summary of this function goes here
%   Detailed explanation goes here
    
    % calculate padding size
    padSize = floor(size(str_element,2)/2)
    
    % pad image with zeros
    img_pad = padarray(img,[padSize padSize],0);
    
    % initialize array for dilated image
    output_img = zeros(size(img));
    
    % iterate through each pixel in original image
    for i = 1:size(img,1)
        for j = 1:size(img,2)

            % crop image patch
            img_patch = img_pad(i:i+2*padSize,j:j+2*padSize); % assuming the structuring element is 3x3
            
            % part of image patch under the structuring element
            img_patch_overlay = img_patch.*str_element;
            
            % if there is at least one non-zero element under the structuring element, 
            % then assign 1
            if any(img_patch_overlay(:)>0)
                output_img(i,j) = 1;
            end
        end
    end
    
    % remove added padding
    %output_img = output_img(1+padSize:end-padSize, 1+padSize:end-padSize);
end

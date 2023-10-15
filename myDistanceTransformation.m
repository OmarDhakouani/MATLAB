function [dist_img] = myDistanceTransformation(img, str_element)
%MYDISTANCETRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here
    
    % initialize distance image
    dist_img = zeros(size(img));
    dist_img(:) = -255;

    tmp_img = img; % temporary image which is recurrently eroded
    finished = false;
    distance = 0;
    disp('Erosion...');
    while ~finished
        % erode and calcuate the image difference
        img_eroded = myErosion(tmp_img,str_element);

        diff_img = tmp_img-img_eroded;

        % encode positive distances (inside of the segment)
        dist_img(diff_img == 1) = distance;

        % update temporary image
        tmp_img = img_eroded;

        % increment distance
        distance = distance+1  ;

        % condition to leave the while-loop
        if all(all((dist_img>=0) == (img==1)))
            finished = true;
        end
    end

    tmp_img = img; % temporary image which is recurrently dilated
    finished = false;
    distance = -1;
    disp('Dilation...');
    while ~finished
        % dilate and calculate the image difference
        img_dilated = myDilation(tmp_img,str_element);
        diff_img = img_dilated-tmp_img ;

        % encode negative distances (outside of the segment)
        dist_img(diff_img == -1) = distance;
        
        % update temporary image
        tmp_img = img_dilated;

        % decrement distance
        distance = distance-1;

        % condition to leave the while-loop
        if all(all((dist_img<0 & dist_img~=-255) == (img==0)))
            finished = true;
        end
    end
end


function isReceipt = classifyImage(I)
    % This function processes an image and
    % classifies the image as receipt or non-receipt
    
    % Processing
    gs = im2gray(I);
    gs = imadjust(gs);
    
    mask = fspecial("average",3);
    gsSmooth = imfilter(gs,mask,"replicate");
    
    SE = strel("disk",8);  
    Ibg = imclose(gsSmooth, SE);
    Ibgsub =  Ibg - gsSmooth;
    Ibw = ~imbinarize(Ibgsub);
    
    SE = strel("rectangle",[3 25]);
    stripes = imopen(Ibw, SE);
    
    signal = sum(stripes,2);  

    % Classification
    minIndices = islocalmin(signal,"MinProminence",70,"ProminenceWindow",25); 
    Nmin = nnz(minIndices);
    isReceipt = Nmin >= 9;
    
end
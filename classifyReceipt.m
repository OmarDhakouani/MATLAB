ds = imageDatastore("foldername");
nFiles = numel(ds.Files);
isReceipt = false(1,nFiles);
for i =1:nFiles
    I = readimage(ds,i);
    isReceipt(i) = classifyImage(I);
end
receiptFiles=ds.Files(isReceipt)
disp("Receipts found :")
montage(receiptFiles)
receiptFiles=ds.Files(~isReceipt)
disp("non-Receipts found :")
montage(receiptFiles)
function [img_filt] = myGaussianFFT(img, kSize, sigma)
% Filtering with FFT

% Info
disp('filtering in frequency domain...')

% Kernel erstellen
kernel = fspecial("Gaussian",[kSize,kSize],sigma);

%% Filtern mittels FFT

% Zeit erfassen
tic;

% FT des Bildes
img_ft = fft2(img);

% FT des Kernels
kernel_ft = fft2(kernel,size(img,1),size(img,2));

% Filtern in Fourier Domain durch Multiplikation von FT des Bildes und
% Amplitude der FT des Kernels
img_filt_ft = img_ft.*abs(kernel_ft);

% Rekonstruktion des Bildes
img_filt = ifft2(img_filt_ft);

elapsed = toc;
disp(['elapsed time FFT-version: ',num2str(elapsed)]);
img_filt = mat2gray(abs(img_filt));

%% VisualisierungmyGaussianSpace

figure('WindowState','maximized')
% Gauss-Kernel visualisieren
subplot(231);
imshow(img,[])
title('Originalbild')
subplot(232);
imshow(mat2gray(kernel),[])
title('Kernel')
subplot(233);
imshow(img_filt,[])
title('Gaussgefiltertes Bild')
subplot(234);
imshow(mat2gray(log(1+abs(img_ft))),[]);
title('FFT des Originalbildes')
subplot(235);
imshow(mat2gray(log(1+abs(kernel_ft))),[]);
title('FFT des Kernels')
subplot(236);
imshow(mat2gray(log(1+abs(img_filt_ft))),[]);
title('FFT des Gaussgefilterten Bildes')
sgtitle(['Gaussfilterung mit ', num2str(kSize), '-er Kernel und \sigma = ', num2str(sigma)])

end
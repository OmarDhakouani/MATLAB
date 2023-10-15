function [img_filt] = myGaussianSpace(img, kSize, sigma)
% Filtering in space domain

% Info
disp('filtering in space domain...')

% Kernel erstellen
kernel = fspecial("Gaussian",[kSize,kSize],sigma);

%% Filtern im Ortsbereich

% Zeit erfassen
tic;

% Gefiltertes Bild initialisieren
img_filt = img;

% Bildrand mit Nullen auffüllen (Padding) :
%   Größe des Padding-Randes bestimmen
padSize = floor(kSize/2);
img_padded = padarray(img,[padSize padSize]);


% iteriere über jede Zeile des Bildes (ohne Padding)
for i = 1:size(img,1)

    % iteriere über jede Spalte des Bildes  (ohne Padding)
    for j = 1:size(img,2)

        % Platzehalter für Wert der Faltung
        summe = 0;

        % Hier kommt die Faltung:
        for k =-1:1 
                for l=-1:1 
    
                    % Pixelwert
                    val1 = img_padded(i+k+padSize,j+l+padSize);
    
                    % Kernelwert
                    val2 = kernel(k+2,l+2);
    
                    % aufaddieren
                    summe = summe + val1*val2;
                end
        end

        % speichere wert der Faltung an die ensprechende Position
        img_filt(i,j) = summe;
    end
end

elapsed = toc;

disp(['elapsed time: ',num2str(elapsed)]);

%% Visualisierung

figure('WindowState','maximized')
subplot(131);
imshow(img,[])
title('Originalbild')
subplot(132);
imshow(mat2gray(kernel),[])
title('Kernel')
subplot(133);
imshow(img_filt,[])
title('Gaussgefiltertes Bild')
sgtitle(['Gaussfilterung im Ortsbereich mit ', num2str(kSize), '-er Kernel und \sigma = ', num2str(sigma)])

end
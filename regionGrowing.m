function [img_seg] = regionGrowing(img_bin,seed)

% Segmentation Map mit Startwert -1 in Größe des Bildes anlegen
img_seg=-1*ones(size(img_bin));

% Labelvariable initialisieren
label=-1;

% Alle Pixel durchlaufen
for x = 1:size(img_bin,1)
    for y = 1:size(img_bin,2)

        % Check ob Punkt noch unsegmentiert
        if img_seg(x,y)==-1
            % Label inkrementieren
            label=label+1;
            % Flood Fill aufrufen
            img_seg=floodFill(x, y, label,seed, img_bin, img_seg);
        end
        
    end
end

end


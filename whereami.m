function whereami()


% definition of global variables:
row_count = 10; %matrix row count
column_count = 10; %matrix column count
max_ap_number = 6; %access point count
max_tp_number = 10; %test point count
max_ble_number = 6; %bluetooth beacon count
sigma = 5/3;
wifi_n = 3;
wifi_Pd0 = -30;
ble_n = 1.35;
ble_Pd0 = -72.3;

% definition of Matrix to store all area.
M = rand(row_count, column_count);
[r c] = size(M);

%# text location and labels
[xloc yloc] = meshgrid(1:c,1:r);
xloc = xloc(:); yloc = yloc(:);
str = strtrim(cellstr( num2str(M(:),'%.3g') ));

xticklabels = cellstr( num2str((1:c)','X%d') );
yticklabels = cellstr( num2str((1:r)','Y%d') );

% TODO: Extract a function -> Define Points
%# plot access point cells

msize = numel(M);
aps = M(randperm(msize, max_ap_number)); %choose random # access points
apmask = ismember( M, aps );

msize1 = numel(M);
bps = M(randperm(msize1, max_ble_number)); %choose random # ble beacon points
bpmask = ismember( M, bps );

msize2 = numel(M);
tps = M(randperm(msize2, max_tp_number)); %choose random # test points
tpmask2 = ismember( M, tps );

%assign 'a' or 't' or '' for each cell
%TODO: Update label for overlapping cells
T = zeros(size(M));
for ii = 1:numel(M)
    if ismember(M(ii), aps) 
        T(ii) = 'a'; 
    elseif ismember(M(ii), tps) 
        T(ii) = 't'; 
    else
        T(ii) = 32;
    end
end
str = cellstr( char((T(:))) );

%{
%plot access points
h = imagesc(1:c, 1:r, ones(size(M)));
set(h, 'AlphaData', apmask)

%plot test points
hold  on;
h2 = imagesc(1:c, 1:r, ones(size(M)));
set(h2, 'AlphaData', tpmask2)
%}

%{
%calculate RSS and store in results array
results = strings(length(aps)*length(tps),3);
rowNo = 1;
textY = 0;
textX = 12;

%Set headers 
results(rowNo, 1) = 'Access Point';
results(rowNo, 2) = 'Test Point';
results(rowNo, 3) = 'P(d)';

%display headers
text(textX, textY, results(rowNo, 1), 'FontSize',8, 'HorizontalAlignment','center');
textX = textX+2;
text(textX, textY, results(rowNo, 2), 'FontSize',8, 'HorizontalAlignment','center');
textX = textX+2;
text(textX, textY, results(rowNo, 3), 'FontSize',8, 'HorizontalAlignment','center');
textX = textX+2;
%}

% offline db should be created for KNN algorithm. 
db = offline_training_rss_values(M, aps, bps, row_count, column_count, wifi_n, ble_n, wifi_Pd0, ble_Pd0);

% displaying offline database.
% TODO: Commented out or use a compiler switch for all trace lines. 
disp("--Offline Database--")
disp(db)

% saving offline db in csv format. 
csvwrite('offline_db', db);

% each row of FingerprintMatrix will be a fingerprint value of related test point. 
FingerprintMatrix = zeros(max_tp_number, max_ap_number + max_ble_number);
FingerprintMatrix_wnoise = zeros(max_tp_number, max_ap_number + max_ble_number);

for i=1:max_tp_number
  randomTPValue = tps(i);
  [TProw, TPcolumn]=find(M == randomTPValue);
  
  [fp, fp_wn] = calculate_fingerprint(M, aps, bps, TProw, TPcolumn, wifi_n, ble_n, wifi_Pd0, ble_Pd0, sigma);
  FingerprintMatrix(i,:) = fp;
  FingerprintMatrix_wnoise(i,:) = fp_wn;
  
  % location prediction algorithm should be run in here. 
  % calculate and sum error. (predX, predY; TProw, TPcolumn)
  
  closest_location = predict_location(db, fp_wn);
  disp([num2str(TProw) ,', ' , num2str(TPcolumn) , ' position predicts :: ' , num2str(closest_location(1)) , ', ' , num2str(closest_location(2))]);
  get_error_margin([TProw, TPcolumn], closest_location);
  
end


%disp(FingerprintMatrix)
%disp("Calculated FingerPrinting Matrix With Noise: ")
%disp(FingerprintMatrix_wnoise)

%{
for i=1:length(aps)
    randomAPValue=aps(i);
    [AProw, APcolumn]=find(M == randomAPValue);

    for j=1:length(tps)
        rowNo = rowNo + 1;
        textY = textY+0.3;
        textX = 12;
        randomTPValue=tps(j);
        [TProw, TPcolumn]=find(M == randomTPValue);

        %find euclidean distance
        X = [AProw, APcolumn; TProw,TPcolumn];
        d = pdist(X,'euclidean');

        n = 3;
        Pd0 = -30;
        sigma = 5;
        Pd = Pd0 - (10.*n.*log10(d)) + sigma; %%calculate RSS Value for wifi
        
        results(rowNo, 1) = strcat('AP [X', num2str(APcolumn), ',Y',num2str(AProw),']');
        results(rowNo, 2) = strcat('TP [X',num2str(TPcolumn), ',Y',num2str(TProw),']');
        results(rowNo, 3) = num2str(Pd);
        
        %display the access point, test point and P(d)
        text(textX, textY, results(rowNo, 1), 'FontSize',8, 'HorizontalAlignment','center');
        textX = textX+2;
        text(textX, textY, results(rowNo, 2), 'FontSize',8, 'HorizontalAlignment','center');
        textX = textX+2;
        text(textX, textY, results(rowNo, 3), 'FontSize',8, 'HorizontalAlignment','center');
        textX = textX+2;

        end
    
end
%T = array2table(results);

%hold on;
%f = figure;
%uit = uitable(f);
%uit.Data = T;
%uit.Position = [20 20 258 78];

colormap(summer)            %# colormap([0 1 0])


set(gca, 'Box','on', 'XAxisLocation','top', 'YDir','reverse', ...
    'XLim',[0 c]+0.5, 'YLim',[0 r]+0.5, 'TickLength',[0 0], ...
    'XTick',1:c, 'YTick',1:r, ...
    'XTickLabel',xticklabels, 'YTickLabel',yticklabels, ...
    'LineWidth',2, 'Color','none', ...
    'FontWeight','bold', 'FontSize',8, 'DataAspectRatio',[1 1 1]);

%# plot grid
xv1 = repmat((2:c)-0.5, [2 1]); xv1(end+1,:) = NaN;
xv2 = repmat([0.5;c+0.5;NaN], [1 r-1]);
yv1 = repmat([0.5;r+0.5;NaN], [1 c-1]);
yv2 = repmat((2:r)-0.5, [2 1]); yv2(end+1,:) = NaN;
line([xv1(:);xv2(:)], [yv1(:);yv2(:)], 'Color','k', 'HandleVisibility','off')

%# plot text
text(xloc, yloc, str, 'FontSize',8, 'HorizontalAlignment','center');
%}

end  
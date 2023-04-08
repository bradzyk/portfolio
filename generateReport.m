function generateReport(allHurricaneData)

% open a new file to store the report in (with write permissions)
fid = fopen('hurricaneReport.csv', 'w');

% loop thru all the hurricane data
for i=1:length(allHurricaneData)

    % store variables for each part of the data
    name = allHurricaneData(i).name{1};
    date1 = allHurricaneData(i).date{1};
    date2 = allHurricaneData(i).date{end};
    maxWind = max(allHurricaneData(i).wind);
    maxPressure = max(allHurricaneData(i).pressure);
    % get max category by using calcCategory on the maximum wind
    [cat,col] = calcCategory(maxWind);
    maxCategory = cat;
    % print output to file using commas as delimiters for csv
    fprintf(fid, '%s,%s,%s,%d,%d,%d\n', name, date1, date2, maxWind, maxPressure, maxCategory);

end

% close the file
fclose(fid);

end
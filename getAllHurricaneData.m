function allHurricaneData = getAllHurricaneData(allHurricanesFileName)

data = readtable(allHurricanesFileName, 'ReadVariableNames', false);

% get number of filenames (to use in the for loop)
[r,c] = size(data);

% loop thru all the filenames
for i = 1:r
    % set filename
    fileName = data{i,1};
    % concatenate full filename (including going into the data directory)
    str = strcat('data/',fileName);
    % convert filename to character array
    str2 = char(str);
    % isolate the hurricane name from file name
    nameAlone = extractBefore(fileName, '.');

    % read tables for text and readmatrix for numeric values
    indivData = readtable(str2);
    indivDataNums = readmatrix(str2);
    % convert to cells for usability
    newData = table2cell(indivData);

    % set data for each element to its field in the structure
    element.name = nameAlone;
    element.date = newData(:,1);
    element.Xs = indivDataNums(:,5);
    element.Ys = indivDataNums(:,6);
    element.wind = indivDataNums(:,7);
    element.pressure = indivDataNums(:,8);

    % store the structure element in a larger structure array called
    % 'allData' at the index 'i'
    allData(i) = element;
end

% return the structure array
allHurricaneData = allData;

end






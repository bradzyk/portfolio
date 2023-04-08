% Name(s): Bradley Rupczyk
% Email(s): barupczy@ncsu.edu
% Date: 11/25/22
% Lab Section 205
% Project 3: Hurricane Mapper, Fall 2022

clear; clc; close all;

% create strings to simplify print statement
introStr = ['--------------------------------\nWelcome to Hurricane Analysis' ...
    '\n--------------------------------\n'];
optionsStr = ['Animate Specific Hurricane[1]\n' ...
    'Animate All Hurricanes[2]\n' ...
    'Create Hurricane Report[3]\n'];
% print out both strings (concatenated as one array)
fprintf([introStr,optionsStr]);
% get user input and store it in a variable 'option'
option = input('Select action: ');

% call function to get all the hurricane data and store in a variable
allHurricaneData = getAllHurricaneData('data/allHurricanes.csv');

if option == 1
    % animate a specific hurricane

    % loop thru all the hurricane data, extract the names, and put them
    % into an array 'allNames'
    for i = 1:length(allHurricaneData)
        allNames(i) = allHurricaneData(i).name;
    end

    % get index of selected hurricane using a list dialog
    indx = listdlg('ListString', allNames, 'SelectionMode', 'single');

    % create background figure
    createFigureWithBackground();
    % make a string for the title using the name of the hurricane at indx
    name = sprintf('Hurricane %s, 2017', allNames{indx});
    % set the string to the title
    title(name);
    % call the plot animation function with the hurricane data at indx
    animatePlotHurricane(allHurricaneData(indx));

elseif option == 2
    % animate all hurricanes

    % create background figure
    createFigureWithBackground();
    % set title
    title('Hurricanes in 2017');
    % loop thru all the hurricane data
    for j = 1:length(allHurricaneData)
        % get the name of hurricane at j and store it
        hurricaneName = allHurricaneData(j).name{1};
        % add a text label on the plot at the first x and y with the
        % hurricane name previously stored
        text(allHurricaneData(j).Xs(1), allHurricaneData(j).Ys(1),hurricaneName,'Color',[1 1 1], 'FontSize',14);
        % animate hurricane at j
        animatePlotHurricane(allHurricaneData(j));
    end

elseif option == 3
    % create a hurricane report
    % call report generate function with all the hurricane data
    generateReport(allHurricaneData);
else
    % invalid option number
    fprintf('Exiting program. Incorrect action.\n');
end

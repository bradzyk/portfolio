function animatePlotHurricane(hurricaneData)
% initialize a variable counter i
i = 1;
% loop thru the length of the hurricane's x values
while i <= length(hurricaneData.Xs)
    % set the x and y variables to those in the hurricane's data
    x = hurricaneData.Xs(i);
    y = hurricaneData.Ys(i);
    % get the color from the calcCategory function
    [category,color] = calcCategory(hurricaneData.wind(i));
    % plot using the color and modify the marker size
    plot(x,y,'b.','Color',color,'MarkerSize',15);
    % pause to give animation effect
    pause(0.01);
    % increment the 'i' counter
    i = i + 1;
end

end
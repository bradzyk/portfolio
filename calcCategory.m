function [category, color] = calcCategory(wind)

% if wind is between certain values, set it's category and color
% accordingly

if wind <= 38
    cat = 0;
    col = [0 1 1]; % turquoise
elseif wind <= 73
    cat = 0;
    col = [0.25 1 0]; % green
elseif wind <= 95
    cat = 1;
    col = [1 1 0]; % yellow
elseif wind <= 110
    cat = 2;
    col = [1 0.75 0]; % orange
elseif wind <=129
    cat = 3;
    col = [1 0 0]; % red
elseif wind <= 156
    cat = 4;
    col = [0.75 0 1]; % violet
elseif wind >= 157
    cat = 5;
    col = [1 0 1]; % pink
end

% set return values to the shortened ones
category = cat;
color = col;

end
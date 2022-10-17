function [statistiques_prop] =  moments(img)
%this function returns the computation of the esperance,
% and the first n- moments centered (where n is a variable given in input) of an image given in input 

% input variables: 
% img : input image
% n : an integer

n = 2;

[L,C] = size(img);

for k = 1:n
    statisticList{k} = 0;
end

% definition of a list 
for k = 1:n
    for i = 1:L
        for j = 1:C
            statisticList{k} = statisticList{k} + img(i,j) ^ (k-1) / (L * C);
        end
    end
end

statistiques_prop{1} = statisticList{1};
statistiques_prop{2} = statisticList{2} - statisticList{1}^2;
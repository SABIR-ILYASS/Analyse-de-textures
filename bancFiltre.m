function [listSignature] = bancFiltre(img)

imageSignature = zeros(size(img));
% la base des 5 filtres:
L{1} = [ 1 4 6 4 1 ] ; 
L{2} = [-1 -2 0 2 1 ] ;
L{3} = [ -1 0 2 0 -1 ] ;
L{4} = [ 1 -2 0 2 -1 ] ;
L{5} = [ 1 -4 6 -4 1 ] ;

% création de base des 25 filtres : par produit des bases des filtres:
for i = 1:5
    for j = 1:5
        LAW{i,j}=L{i}'*L{j};
    end
end

for i=1:5
    for j=1:5
        listSignature{i,2*j-1} = mean(imfilter(img,LAW{i,j},'replicate'));
        listSignature{i, 2*j} = var(img,LAW{i,j}, 'replicate')
    end
end

end
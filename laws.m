% filtre de Laws
% base de 25 filtres

clear all;
close all;
clc

% L{1} = [ 1 2 1 ] ;
% L{2} = [-1 0 1 ] ;
% L{3} = [ -1 2 -1 ] ;

L{1} = [ 1 4 6 4 1 ] ; % conv(L{1},L{1})
L{2} = [-1 -2 0 2 1 ] ;
L{3} = [ -1 0 2 0 -1 ] ;
L{4} = [ 1 -2 0 2 -1 ] ;
L{5} = [ 1 -4 6 -4 1 ] ;

for i=1:5 % création base des 25 filtres
    for j=1:5
        LAW{i,j}=L{i}'*L{j};
    end
end

I=imread('Database\HC1_1.bmp');
I=double(I);
n=1;
for i=1:5
    for j=1:5
        IF{i,j}=imfilter(I,LAW{i,j},'replicate');
        fig=imshow(IF{i,j},[]);
        pause(1);
%         ii=num2str(i);
%         jj=num2str(j);
%         name=['law' ii jj '.png'];
%         saveas(fig,name);
        n=n+1;
    end
end
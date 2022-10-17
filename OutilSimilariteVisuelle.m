% script de test similarité signatures simples sur classification des textures
% Hubert KONIK

%% mise en mémoire de toute la base
clc
close all;
clear all;

rep = 'NG/';
list=dir([rep '*.jpg']);
nbIm=numel(list);

% définition de la signature, utilisation des pointeurs (ou adresses) vers une fonction pour permettre le passage de fonctions en argument
% ici choix signature pour l'instant mean2, std2, entropy, skewness, kurtosis etc
handle = @std2; 

for n = 1:nbIm
    img = imread(sprintf('%simg%d.jpg',rep,n));
    tab{n}=img; 
    nom{n}=sprintf('img%d',n);
    sig{n}=feval(handle,img); % choix de la signature
end


%% choix de l'image pour afficher les images les plus similaires

numImg = 134;
srcImg = sprintf('NG/img%d.jpg',numImg);
img = imread(srcImg);
ref = feval(handle,img); 

% calcul 
for j=1:nbIm
    comp(j,1) = abs(ref-sig{j}); % écart en valeur absolue, 0 pour la cible !
    comp(j,2) = j; % numéro image correspondant
end
Trie = sortrows(comp,1); % tri ordre croissant selon la 1° colonne, basée signature
   
% affiche des 5 plus proches, distance croissante 
subplot(2,3,1); imshow(img); title(nom{numImg});
for sim=2:6  % la 1° image est la cible elle-même
    legende=sprintf('%s \n %.5f',nom{Trie(sim,2)},Trie(sim,1));
    subplot(2,3,sim); imshow(tab{Trie(sim,2)}); title(legende);
end
 
    



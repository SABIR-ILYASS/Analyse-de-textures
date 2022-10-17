%% Analyse de la texture
% SABIR ILYASS
% L'objectif: On veut classifier les images de data

%% mise en mémoire de toute la base
clc
close all;
clear all;

% direction vers répertoire de la base
rep = 'Database/';
List = dir([rep '*.bmp']); % une liste qui va contenir des chemins des images
nbIm=numel(List);

% calcul de la signature

for n = 0:nbIm-1
    img = imread(sprintf("%sHC%d_%d.bmp",rep,floor(n/10)+1,floor(mod(n,10))));
    tab{n+1}=img; 
    nom{n+1}=sprintf('img%d',n);
    sig{n+1}=signature(img, 'hist'); %  choix de la signature
end


% choix de l'image pour chrecher les images les plus similaires:

numImg = 10;
srcImg = sprintf('Database/HC%d_%d.bmp',floor(numImg/10)+1,floor(mod(numImg,10)));
img = imread(srcImg);
ref = signature(img,'cooccurrence');  

% calcul 
for j=1:nbIm
    comp(j,1) = similarite(ref,sig{j},'cooccurrence');
    comp(j,2) = j; % numéro image correspondant
end
Trie = sortrows(comp,1); % tri ordre croissant selon la 1° colonne, basée signature
   
% affiche des 9 plus proches, distance croissante 
subplot(2,5,1); imshow(img); title(nom{numImg});
for sim=1:9  % la 1° image est la cible elle-même
    legende=sprintf('%s \n %.5f',nom{Trie(sim,2)},Trie(sim,1));
    subplot(2,5,sim+1); imshow(tab{Trie(sim,2)}); title(legende);
end

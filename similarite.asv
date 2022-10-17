function [mesim]=similarite(data1,data2,numsim)
mesim=0;
 switch numsim 
     case 'hist'
         % intersection de deux histogrammes:
         mesim = sum(min(data1(:),data2(:)));
     case 'cooccurrence'
         mesim = norm (data1 - data2);
     case 'spectral'




          
 end     
 end
 
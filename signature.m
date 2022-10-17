function [sign] = signature(img, numsing)

switch numsing
    case 'hist'
        sign = imhist(img);
    case 'cooccurrence'
        sign = graycomatrix(img);
    case 'spectral'
        % sign = 


end
end


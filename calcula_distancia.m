function [distance] = calcula_distancia(interp, mY)
    distance = polyval(interp, mY);
end


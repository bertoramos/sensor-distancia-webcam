
function [merr] = error_interpolacion(datos, orden)
    x = reshape(datos.', [size(datos,1)*size(datos,2), 1]);
    y = repelem([0 2 4 6 8 10], 10);
    p = polyfit(x, y, orden);
    
    pred = polyval(p, x);
    
    error = pred-y';
    merr = mean(abs(error));
end

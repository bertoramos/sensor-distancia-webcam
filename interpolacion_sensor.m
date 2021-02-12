function [distance] = interpolacion_sensor(x0, orden)
    muestras = load('medidas.mat').medidas;
    
    v = [0 0.02 0.04 0.06 0.08 0.1];
    x = reshape(muestras, [1, size(muestras,1)*size(muestras,2)]);
    y = repelem(v, 10);
    
    disp(size(x));
    disp(size(y));
    
    p = polyfit(x, y, orden);
    
    distance = polyval(p, x0);
    
end


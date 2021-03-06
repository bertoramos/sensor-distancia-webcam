function [funcion] = interpolacion_sensor(datos, orden)
    
    v = [0 2 4 6 8 10];
    x = reshape(datos.', [size(datos,1)*size(datos,2), 1]);
    y = repelem(v, 10);
    
    funcion = polyfit(x, y, orden);
    
end


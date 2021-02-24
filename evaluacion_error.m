clear;
clc;

orden = 3;

vid = videoinput('winvideo', 1);
preview(vid);

pause;

r = load('roi.mat').r;

real_dist = 10;

N = 30;
muestras = zeros(1, N);

for i = 1:N
    im = getsnapshot(vid); im = im(:,:,1);

    imROI = im(round(r(2):r(2)+r(4)), round(r(1):r(1)+r(3)));

    [row, col] = find(imROI<=125);
    mY = mean(row);

    interp = interpolacion_sensor(load('medidas2.mat').medidas, orden);

    dist = calcula_distancia(interp, mY);
    
    muestras(i) = dist;
    
    fprintf("%d / %d\n", i, N);
end

mean_val = mean(muestras);
std_val = std(muestras);
fprintf("Valor real : %f\n", real_dist);
fprintf("Valor medio : %f\n", mean_val);
fprintf("Desviación : %f\n", std_val);

pd = fitdist(muestras' ,'Normal');
ci = paramci(pd);

fprintf("Intervalo de la media : %f | %f\n", ci(1,1), ci(2,1));
fprintf("Intervalo de la desviación : %f | %f\n", ci(1,2), ci(2,2));
fprintf("Error: %f\n", abs(real_dist - mean_val));

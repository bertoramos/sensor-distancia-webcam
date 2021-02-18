clear;

vid = videoinput('winvideo', 1);
preview(vid);

im = getsnapshot(vid); im = im(:,:,1);

imshow(im);

r = getrect;

imROI = im(r(2):r(2)+r(4), r(1):r(1)+r(3));

imshow(imROI);

[row, col] = find(imROI<=125);
mY = mean(row);

interp = interpolacion_sensor(load('medidas2.mat').medidas, 1);

xs = 12:1:132;
ys = calcula_distancia(interp, xs);

plot(xs, ys);

dist = calcula_distancia(interp, mY);
fprintf("Encontrado que mY = %f, la distancia es: %f\n", mY, dist);

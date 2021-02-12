
vid = videoinput('winvideo', 1);
preview(vid);

im = getsnapshot(vid); im = im(:,:,1);

imshow(im);

r = getrect;

imROI = im(r(2):r(2)+r(4), r(1):r(1)+r(3));

imshow(imROI);

histogram(imROI(:));


[row, col] = find(imROI<=100);
mY = mean(row);

valores_filas(end+1) = mY;

function histogrameq(ima)
ima = rgb2gray(ima);
%sacamos tamaño imagen
[fil,col,~] = size(ima);
%la cambiamos a formato uint8
finalResult = uint8(zeros(fil,col));
%declaramos variables
Npix = fil*col;
frec = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cont = zeros(256,1);
outpic = zeros(256,1);

%for para sacar los valores de la imagen
for i = 1:1:fil
    for j = 1:1:col
        val = ima(i,j);
        frec(val+1) = frec(val+1)+1;
        pdf(val+1) = frec(val+1)/Npix;
    end
end
sum =0 ;
NivInt = 255;

%for para ecualziar los valores de imagen
for i = 1:1:size(pdf)
    sum =sum +frec(i);
    cont(i) = sum;
    cdf(i) = cont(i)/ Npix;
    outpic(i) = round(cdf(i) * NivInt);
end

%for para crear la nueva imagen
for i = 1:1:fil
    for j = 1:1:col
        finalResult(i,j) = outpic(ima(i,j) + 1);
    end
end
%impresion de las imagenes e histogramas
subplot(1,4,1),imshow(ima),title('imagen original');
subplot(1,4,2),histogram(ima),title('hist. original');
subplot(1,4,3),imshow(finalResult),title('imagen ecualizada');
subplot(1,4,4),histogram(finalResult),title('hist ecualizado');
end
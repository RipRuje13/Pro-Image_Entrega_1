function f_mult(im)

[fil,col,~] = size(im);

%se crea la matriz con el mismo tamaño de nuestra imagen
ms = [];
for i = 1 : fil/2
    for j = 1 : col/2
        ms(i,j) = i *j;
    end
end

%en base a la matriz se crea una imagen y se guarda como jpg
ms = [ms fliplr(ms);flipud([ms fliplr(ms)])];
imagesc(ms);
saveas(gcf,'artifi','jpg')
colormap gray;
saveas(gcf,'artifi','jpg')
art = imread("artifi.jpg");

%volvemos a sacar el tamaño de la imagen original 
%y se multiplica con la imagen artificial
g=size(im);
%para asegurarnos igualamos el tamaño de las imagenes 
im_ma =imresize(art,[g(1),g(2)]);
for i = 1:g(1)
    for j = 1:g(2)
        for k=1:3
            salida(i,j,k)=(im(i,j,k)+im_ma(i,j,k));
        end
    end
end
%mostramos la imagen origina, la artificila y el resultado
subplot(1,3,1),imshow(im),title('foto');
subplot(1,3,2),imagesc(ms),title('imagen artificial');
subplot(1,3,3),imshow(salida),title('multiplicacion');

end

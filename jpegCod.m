function imagenJPEG = jpegCod(x)
%function imagenJPEG = jpegCod(x)
%
% Función de ejemplo para estudiar la aplicación de la codificación Huffman
%a la codificación JPEG de imágenes. 
%
% Entrada:
%  - x: imagen a codificar (para leer un archivo de imagen, utilizar
%  imread). La función está pensada para imágenes en escala de grises. 
%
% Salida:
%  - imagenJPEG: La imagen codificada, sin utilizar codificación entrópica.



%Para poder trabajar más cómodo, convierto la imagen a formato 'double'.
if ~isa(x,'double')
    x = double(x);
end

%Matriz de cuantificación JPEG
Q = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 
%Voy reservando espacio para la imagen codificada
imagenJPEG = zeros(size(x));


%Proceso de codificación por bloques 8x8
for i=1:8:size(x,1)
    for j=1:8:size(x,2)
        bloque = x(i:i+7, j:j+7);           % Cojo el bloque
        DCTbloque = dct2(bloque);           % Calculo la DCT
        bloqueQ = round(DCTbloque./Q);      % Cuantifico
        imagenJPEG(i:i+7,j:j+7) = bloqueQ;  % Lo paso a la imagen global
    end
end


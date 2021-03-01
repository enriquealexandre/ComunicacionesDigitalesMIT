function y = jpegDec(imagenJPEG)
%function y = jpegDec(imagenJPEG)
%
% Función de ejemplo para estudiar la aplicación de la codificación Huffman
%a la codificación JPEG de imágenes. 
%
% Entrada:
%  - imagenJPG: imagen codificada en JPEG, tal cual sale de la función jpegCod 
%
% Salida:
%  - y: La imagen reconstruida.


%Matriz de cuantificación (es la misma que en el codificador
Q = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 

%Reservo espacio para la imagen de salida
y = zeros(size(imagenJPEG));

%Proceso de decodificación (bloques 8x8)
for i=1:8:size(imagenJPEG,1)
    for j=1:8:size(imagenJPEG,2)
        bloque = imagenJPEG(i:i+7, j:j+7);  %Cojo el bloque
        bloqueIQ = bloque.*Q;               %Cuantificación inversa
        IDCTbloque = idct2(bloqueIQ);       %IDCT  
        y(i:i+7,j:j+7) = IDCTbloque;        %Lo paso a la imagen global
    end
end

%Por compatibilidad, vuelvo al formato uint8. 
y = uint8(y);   

%Para ver la imagen, imshow

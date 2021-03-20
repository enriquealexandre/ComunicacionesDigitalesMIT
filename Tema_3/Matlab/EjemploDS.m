%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo 1
%
% Genero una señal DS, con un solo interferente.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 10; % Número de bits transmitidos
Lc = 5;  % numero de chips por bit

data = sign(2*rand(1,N)-1);         % Genero datos aleatorios
codigo = sign(2*rand(1,Lc*N)-1);    % Genero el código DS
repeated_data = repelem(data,Lc);   % Aplico DS
tx = repeated_data.*codigo;
interferencia = sign(2*rand(1,Lc*N)-1); %Genero las interferencias

rx = tx + interferencia;    %Sumo señal transmitida e interferencia
dec_data = rx.*codigo;      %Decodifico multiplicando por el código
decoded_data = sign(sum(reshape(dec_data,Lc,N),1)); %Decido cada uno de los bits por mayoría

%Contabilizo errores
errores = length(find(data-decoded_data));

%Pinto cosas
subplot(611)
stem(data)
axis([0.5 N+0.5 -1.2 1.2])
title(['Señal original: ' num2str(N) 'bits'] )

subplot(612)
stem(repeated_data)
axis([0.5 Lc*N+0.5 -1.2 1.2])
title(['Señal repetida: ' num2str(N*Lc) 'chips'] )

subplot(613)
stem(codigo)
axis([0.5 Lc*N+0.5 -1.2 1.2])
title('Código')

subplot(614)
stem(tx)
axis([0.5 Lc*N+0.5 -1.2 1.2])
title('Señal transmitida (datos·código)')

subplot(615)
stem(rx)
axis([0.5 Lc*N+0.5 -2.2 2.2])
title('Señal recibida: tx+interf')

subplot(616)
stem(decoded_data)
axis([0.5 N+0.5 -1.2 1.2])
title(['Señal decodificada (' num2str(errores) ' errores)'])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo 2
%
% Genero una señal DS. Evalúo la pError en
% en función de nº de interferentes y de la
% potencia de los mismos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1e4; % Número de bits transmitidos
Lc = 127;  % numero de chips por bit
maxInterf = 20;
pFactor=0:0.1:1;

data = sign(2*rand(1,N)-1);         % Genero datos aleatorios
codigo = sign(2*rand(1,Lc*N)-1);    % Genero el código DS
repeated_data = repelem(data,Lc);   % Aplico DS
tx = repeated_data.*codigo;
interferencias = sign(2*rand(maxInterf,Lc*N)-1); %Genero las interferencias
pError = zeros(maxInterf, length(pFactor));

for Nint=1:maxInterf   %Número de señales interferentes
    for p=pFactor
        rx = tx + sum(interferencias(1:Nint,:),1).*10^(-p/10);
        dec_data = rx.*codigo;
        decoded_data = sign(sum(reshape(dec_data,Lc,N),1));
        
        errores = length(find(data-decoded_data));
        pError(Nint,round(10*p+1)) = errores/N;
    end
end
plot(pError)
xlabel('Nº de interferentes');
ylabel('Probabilidad de error');
legend(num2str(pFactor'))







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo 3
%
% Genero una señal DS, y visualizo la probabilidad
% de error en función de la SNR (ruido blanco 
% gaussiano)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1e5;  % Número de bits transmitidos
Lc = 127;  % numero de chips por bit
SNRdB = -10:1:10;

data = sign(2*rand(1,N)-1);
repeated_data = repelem(data,Lc);
codigo = sign(2*rand(1,Lc*N)-1);
pError = zeros(size(SNRdB));
for i=SNRdB
    
    snr=10^(i/10);
    sgma=1;
    Eb=2*sgma^2*snr;
    E_chip=Eb/Lc;       % energía por chip
    
    tx = sqrt(E_chip)*repeated_data.*codigo;
    noise = sgma*randn(1,N*Lc);
    rx = tx + noise;
    dec_data = rx.*codigo;
    decoded_data = sign(sum(reshape(dec_data,Lc,N),1));
    pError(SNRdB==i) = length(find(data-decoded_data))/N;
end

plot(SNRdB, pError)
xlabel('SNR (dB)');
ylabel('Probabilidad de error');

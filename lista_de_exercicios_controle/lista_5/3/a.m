clc;
clear;
close all;

% item (a)
s = tf('s');

G = 5/(s + 5);

% resposta ao degrau unitário
figure;
step(G);
grid on;
title('Resposta ao degrau unitário');
xlabel('Tempo (s)');
ylabel('Saída c(t)');

% informaçoes da resposta
info = stepinfo(G);

% constante de tempo
tau = 1/5;

% set point / valor final
setpoint = dcgain(G);

% Exibindo resultados
disp('Resultados:')
fprintf('Constante de tempo tau = %.4f s\n', tau);
fprintf('Tempo de subida Tr = %.4f s\n', info.RiseTime);
fprintf('Tempo de acomodacao Ts = %.4f s\n', info.SettlingTime);
fprintf('Set point = %.4f\n', setpoint);
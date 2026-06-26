clc;
clear;
close all;

% dados da questão
m = 5;
b = 5;
k = 28;

G = tf(1,[m b k]); % monta a função de transferência  

zeta = b/(2*sqrt(m*k)); % calcula o zeta
wn = sqrt(k/m); % calculo de wn

UP = 100*exp((-zeta*pi)/sqrt(1-zeta^2)); % ultrapassagem percentual
Ts = 4/(zeta*wn); % calcula de acomodação 
Tp = pi/(wn*sqrt(1-zeta^2)); % tempo de pico
Tr = (pi - acos(zeta))/(wn*sqrt(1-zeta^2)); % tempo de subida

A = 2; % degrau de amplitude 2
setpoint = A*dcgain(G);

disp('G(s) = ')
G

% exibe o zeta
disp('zeta = ')
disp(zeta)

% exibe o wn
disp('wn = ')
disp(wn)

% exibe o ultrapassagem percentual
disp('%UP = ')
disp(UP)

% exibe o tempo de acomodação 
disp('Ts = ')
disp(Ts)

% exibe o tempo de pico
disp('Tp = ')
disp(Tp)

% exibe o tempo de subida
disp('Tr = ')
disp(Tr)

% exibe o set point
disp('Set Point = ')
disp(setpoint)

% resposta do sistema ao degrau
figure;
step(A*G); % aplica o degrau
grid on;
title('Resposta ao degrau de amplitude 2');

% mapa de polos e zeros 
figure;
pzmap(G);
title('Mapa de Polos e Zeros');
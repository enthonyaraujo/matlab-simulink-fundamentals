clc;
clear;
close all;

% dados da questão
UPporcentagem = 12;       % percentual de overshoot
Ts = 0.6;      % tempo de acomodação

% tirar o percentual do overshoot
UP = UPporcentagem/100;

% calcular zeta
zeta = -log(UP) / sqrt(pi^2 + (log(UP))^2);

% calcular wn pelo tempo de acomodação 
wn = 4/(zeta*Ts);

% montar função de transferência de 2ª ordem
num = wn^2;
den = [1 2*zeta*wn wn^2];

G = tf(num, den);

% mostrar resultados
disp('Zeta = ')
disp(zeta)

disp('Wn = ')
disp(wn)

disp('Função de transferência G(s) = ')
G

disp('Polos = ')
pole(G)

% Mapa de polos e zeros
figure;
pzmap(G);
title('Mapa de Polos e Zeros');

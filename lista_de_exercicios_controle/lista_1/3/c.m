clc;
clear;
close all;

% declarando as variaveis simbolicas
syms t s

% função G(s)
G = s/((s+4)*(s+8));

% R(s) (rampa)
R = 1/s^2;

% Multiplicando R e G
Y = (R * G);

% Fazendo a transformada de laplace de inversa
y = ilaplace(Y);

% mostrando o resultado
pretty(y)


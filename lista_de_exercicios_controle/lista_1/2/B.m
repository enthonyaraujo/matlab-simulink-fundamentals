clc;
clear;
close all;

% declarando as variaveis simbolicas
syms t s

% declarando a função F(s)
F = (s^2 + 12)/(s*(s+2)*(s+3));

% fazendo a transformada inversa de f
f = ilaplace(F);

disp('Transformada inversa de Laplace:')
pretty(f)
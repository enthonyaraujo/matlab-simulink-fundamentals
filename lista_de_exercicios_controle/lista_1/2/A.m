clc;
clear;
close all;

% declarando as variaveis simbolicas
syms t s

% declarando a função F(s)
F = 5 + 6/(s + 4) - (7*s)/(s^2 + 25);

% fazendo a transformada inversa de f
f = ilaplace(F);

disp('Transformada inversa de Laplace:')
pretty(f)z
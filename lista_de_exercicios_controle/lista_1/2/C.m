clc;
clear;
close all;

% declarando as variaveis simbolicas
syms t s

% declarando a função V(s)
V = ((10*s^2)+4)/(s*(s+1)*(s+2)^2);

% fazendo a transformada inversa de v
v = ilaplace(F);

disp('Transformada inversa de Laplace:')
pretty(f)
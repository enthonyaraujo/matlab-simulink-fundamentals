clc;
clear;
close all;

% declarando as variaveis simbolicas
syms t s

% declarando a função H(s)
H = 20/((s+3)*(s^2+8*s+25));

% fazendo a transformada inversa de H
h = ilaplace(F);

disp('Transformada inversa de Laplace:')
pretty(f)
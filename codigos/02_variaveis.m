%% 02 - Variáveis
% Script independente.
clear;
clc;

fprintf('=== Variáveis no MATLAB ===\n\n');

idade = 22;
altura_m = 1.75;
nome_disciplina = "Sistemas de Controle I";

fprintf('idade = %d\n', idade);
fprintf('altura_m = %.2f m\n', altura_m);
fprintf('nome_disciplina = %s\n\n', nome_disciplina);

valor = 10;
Valor = 25;

fprintf('valor = %d\n', valor);
fprintf('Valor = %d\n', Valor);
fprintf('O MATLAB diferencia maiúsculas de minúsculas.\n\n');

ganho_malha_aberta = 8;
constante_tempo = 0.5;
resultado = ganho_malha_aberta * constante_tempo;

fprintf('ganho_malha_aberta = %.2f\n', ganho_malha_aberta);
fprintf('constante_tempo = %.2f s\n', constante_tempo);
fprintf('resultado = %.2f\n\n', resultado);

whos

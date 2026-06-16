%% 04 - Vetores
% Script independente.
clear;
clc;

fprintf('=== Vetores ===\n\n');

vetor_linha = [1 2 3 4 5];
vetor_coluna = [1; 2; 3; 4; 5];

disp('Vetor linha:');
disp(vetor_linha);

disp('Vetor coluna:');
disp(vetor_coluna);

sequencia = 0:2:10;
disp('Sequência de 0 a 10 com passo 2:');
disp(sequencia);

tempo = linspace(0, 2*pi, 9);
disp('Vetor criado com linspace:');
disp(tempo);

fprintf('Primeiro elemento = %d\n', vetor_linha(1));
fprintf('Último elemento = %d\n', vetor_linha(end));

disp('Elementos de 2 a 4:');
disp(vetor_linha(2:4));

disp('Quadrado de cada elemento:');
disp(vetor_linha .^ 2);

u = [1 2 3];
v = [4 5 6];

fprintf('Produto escalar = %.2f\n', dot(u, v));
fprintf('Norma de u = %.4f\n', norm(u));

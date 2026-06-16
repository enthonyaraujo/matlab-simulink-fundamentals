%% 01 - Operações básicas
% Script independente: pode ser executado diretamente.
clear;
clc;

fprintf('=== Operações básicas no MATLAB ===\n\n');

a = 12;
b = 5;

fprintf('a = %.2f\n', a);
fprintf('b = %.2f\n\n', b);
fprintf('a + b = %.2f\n', a + b);
fprintf('a - b = %.2f\n', a - b);
fprintf('a * b = %.2f\n', a * b);
fprintf('a / b = %.4f\n', a / b);
fprintf('a^2   = %.2f\n\n', a ^ 2);

sem_parenteses = 2 + 3 * 4;
com_parenteses = (2 + 3) * 4;

fprintf('2 + 3 * 4   = %.2f\n', sem_parenteses);
fprintf('(2 + 3) * 4 = %.2f\n\n', com_parenteses);

numero_grande = 6.022e23;
numero_pequeno = 1.602e-19;

fprintf('Notação científica: %.4e\n', numero_grande);
fprintf('Notação científica: %.4e\n', numero_pequeno);
fprintf('Resto de %d dividido por %d = %d\n', a, b, mod(a, b));

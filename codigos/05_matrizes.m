%% 05 - Matrizes
% Script independente.
clear;
clc;

fprintf('=== Matrizes ===\n\n');

A = [1 2; 3 4];
B = [5 6; 7 8];

disp('Matriz A:');
disp(A);

disp('Matriz B:');
disp(B);

disp('A + B:');
disp(A + B);

disp('A - B:');
disp(A - B);

disp('Produto matricial A * B:');
disp(A * B);

disp('Produto elemento a elemento A .* B:');
disp(A .* B);

disp('Transposta de A:');
disp(A.');

det_A = det(A);
fprintf('Determinante de A = %.4f\n\n', det_A);

if abs(det_A) > eps
    disp('Inversa de A:');
    disp(inv(A));
else
    disp('A não possui inversa.');
end

b = [5; 11];
x = A \ b;

disp('Solução do sistema A*x = b:');
disp(x);

disp('Verificação A*x:');
disp(A * x);

disp('Autovalores de A:');
disp(eig(A));

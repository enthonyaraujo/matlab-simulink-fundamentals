%% 06 - Função de transferência
% Script independente.
% Requer Control System Toolbox.
clear;
clc;

if exist('tf', 'file') == 0
    error('Este script requer a Control System Toolbox.');
end

fprintf('=== Funções de transferência ===\n\n');

num1 = [1 5];
den1 = [1 3 2];
G1 = tf(num1, den1);

disp('G1 criada com vetores:');
G1

G2 = tf(2, [1 4 3]);

disp('G2 criada diretamente:');
G2

s = tf('s');
G3 = (s^2 + 5) / (s^2 + 3*s + 2);

disp('G3 criada usando s = tf(''s''):');
G3

R = 10;
L = 0.5;
C = 0.01;
G_rlc = 1 / (L*C*s^2 + R*C*s + 1);

disp('Função de transferência do circuito RLC:');
G_rlc

m = 10;
b = 4;
k = 20;
G_mecanico = 1 / (m*s^2 + b*s + k);

disp('Função de transferência do sistema mecânico:');
G_mecanico

disp('Polos do circuito RLC:');
disp(pole(G_rlc));

disp('Polos do sistema mecânico:');
disp(pole(G_mecanico));

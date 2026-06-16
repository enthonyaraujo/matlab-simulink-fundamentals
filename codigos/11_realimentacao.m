%% 11 - Realimentação
% Script independente.
% Requer Control System Toolbox.
clear;
clc;
close all;

if exist('tf', 'file') == 0 || exist('feedback', 'file') == 0
    error('Este script requer a Control System Toolbox.');
end

fprintf('=== Sistemas com realimentação ===\n\n');

s = tf('s');

G = 10 / (s * (s + 2));
H = 1;

disp('Ramo direto G(s):');
G

disp('Realimentação H(s):');
H

% Realimentação negativa: G / (1 + GH)
T_negativa = feedback(G, H, -1);

% Realimentação positiva: G / (1 - GH)
T_positiva = feedback(G, H, 1);

disp('Malha fechada com realimentação negativa:');
T_negativa

disp('Malha fechada com realimentação positiva:');
T_positiva

disp('Polos da realimentação negativa:');
disp(pole(T_negativa));

disp('Polos da realimentação positiva:');
disp(pole(T_positiva));

figure('Name', 'Comparação de realimentações');
step(T_negativa, T_positiva);
grid on;
title('Resposta ao degrau: realimentação negativa e positiva');
legend('Negativa', 'Positiva', 'Location', 'best');

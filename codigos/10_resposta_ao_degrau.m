%% 10 - Resposta ao degrau
% Script independente.
% Requer Control System Toolbox.
clear;
clc;
close all;

if exist('tf', 'file') == 0 || exist('step', 'file') == 0
    error('Este script requer a Control System Toolbox.');
end

fprintf('=== Resposta ao degrau unitário ===\n\n');

% G(s) = (s + 1) / (s^2 + 3s + 1)
num = [1 1];
den = [1 3 1];
G = tf(num, den);

disp('Função de transferência:');
G

[y, t] = step(G);

valor_final_aproximado = y(end);
valor_final_teorico = dcgain(G);

fprintf('Valor final aproximado = %.6f\n', valor_final_aproximado);
fprintf('Valor final teórico = %.6f\n', valor_final_teorico);

figure('Name', 'Resposta ao degrau');
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Resposta ao degrau unitário de G(s)');

%% 12 - Sistemas em série e em paralelo
% Script independente.
% Requer Control System Toolbox.
clear;
clc;
close all;

if exist('tf', 'file') == 0
    error('Este script requer a Control System Toolbox.');
end

fprintf('=== Sistemas em série e em paralelo ===\n\n');

s = tf('s');

G1 = 1 / (s + 1);
G2 = 2 / (s + 2);

disp('G1(s):');
G1

disp('G2(s):');
G2

G_serie = G1 * G2;
G_paralelo = G1 + G2;

disp('Sistema equivalente em série:');
G_serie

disp('Sistema equivalente em paralelo:');
G_paralelo

if exist('series', 'file') ~= 0
    G_serie_funcao = series(G1, G2);
    disp('Verificação da ligação em série:');
    disp(minreal(G_serie - G_serie_funcao));
end

if exist('parallel', 'file') ~= 0
    G_paralelo_funcao = parallel(G1, G2);
    disp('Verificação da ligação em paralelo:');
    disp(minreal(G_paralelo - G_paralelo_funcao));
end

figure('Name', 'Sistemas em série e paralelo');
step(G_serie, G_paralelo);
grid on;
title('Resposta ao degrau dos sistemas equivalentes');
legend('Série', 'Paralelo', 'Location', 'best');

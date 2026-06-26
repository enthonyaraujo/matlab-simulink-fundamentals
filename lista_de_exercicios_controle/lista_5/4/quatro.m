
clc;
clear;
close all;

s = tf('s');

% declarando as funções g1, g2, g3
G1 = 3/(s + 1);
G2 = 2/(s + 1);
G3 = 1/(s + 1);

figure;
step(G1, G2, G3);
grid on;

legend('y1', 'y2', 'y3');
title('Respostas ao degrau unitário');
xlabel('Tempo (s)');
ylabel('Amplitude');
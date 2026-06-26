%% dados de acordo com grafico
UP = 0.254; % ultrapassagem percentual
tp = 2;     % tempo de pico em segundos
J = 1;      % inercia dada no enunciado

%% calcular o coeficiente de amortecimento (zeta)
numerador_zeta = (log(UP))^2;
denominador_zeta = pi^2 + (log(UP))^2;
zeta = sqrt(numerador_zeta / denominador_zeta);

%% calcular a frequência natural (wn)
wn = pi / (tp * sqrt(1 - zeta^2));

%% calcular K1 e K2
K1 = J * wn^2;
K2 = (2 * zeta * wn) / K1;

% exibir os resultados na tela de k1 e k2
fprintf('O valor de K1 é: %.4f\n', K1);
fprintf('O valor de K2 é: %.4f\n', K2);

%% mostrar o grafico
s = tf('s');
G = K1 / (s^2 + K1*K2*s + K1);
figure;
step(G);
title('Resposta ao Degrau Unitário (Prova Real)');
grid on;
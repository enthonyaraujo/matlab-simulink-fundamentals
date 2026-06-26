clc;
clear;
close all;

%% Dados fornecidos na tabela
t = 0:0.25:10;

y = [0
     0.0670
     0.2018
     0.3122
     0.3503
     0.3215
     0.2635
     0.2159
     0.1995
     0.2120
     0.2369
     0.2574
     0.2644
     0.2591
     0.2483
     0.2395
     0.2305
     0.2388
     0.2434
     0.2472
     0.2485
     0.2475
     0.2455
     0.2439
     0.2433
     0.2438
     0.2446
     0.2453
     0.2456
     0.2454
     0.2450
     0.2447
     0.2446
     0.2447
     0.2448
     0.2450
     0.2450
     0.2450
     0.2450
     0.2450
     0.2450];


%% Valor final e ganho estático
amplitudeDegrau = 1;

% Média das últimas amostras
valorFinal = mean(y(end-4:end));

K = valorFinal/amplitudeDegrau;

%% Pico, tempo de pico e ultrapassagem percentual
[valorPico, indicePico] = max(y);

Tp = t(indicePico);

UP = ((valorPico - valorFinal)/valorFinal)*100;
Mp = UP/100;

%% Tempo de acomodação pelo critério de 2%
limiteInferior = 0.98*valorFinal;
limiteSuperior = 1.02*valorFinal;

indiceFora = find(y < limiteInferior | y > limiteSuperior, 1, 'last');

if isempty(indiceFora)
    Ts = 0;
elseif indiceFora < length(t)
    Ts = t(indiceFora + 1);
else
    Ts = NaN;
end

%% Parâmetros do sistema de segunda ordem
zeta = -log(Mp)/sqrt(pi^2 + log(Mp)^2);

wd = pi/Tp;

wn = wd/sqrt(1 - zeta^2);

%% Função de transferência
% G(s) = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)

numerador = K*wn^2;
denominador = [1 2*zeta*wn wn^2];

G = tf(numerador, denominador);

%% Polos, zeros e natureza da resposta
polos = pole(G);
zerosSistema = zero(G);

if zeta == 0
    natureza = "Não amortecida";
elseif zeta > 0 && zeta < 1
    natureza = "Subamortecida";
elseif zeta == 1
    natureza = "Criticamente amortecida";
else
    natureza = "Superamortecida";
end

%% Mostrar resultados
fprintf('\n========== RESULTADOS ==========\n');

fprintf('Valor final: %.4f\n', valorFinal);
fprintf('Ganho estático K: %.4f\n', K);

fprintf('Valor de pico: %.4f\n', valorPico);
fprintf('Ultrapassagem percentual: %.2f %%\n', UP);
fprintf('Tempo de pico: %.2f s\n', Tp);
fprintf('Tempo de acomodação: %.2f s\n', Ts);

fprintf('Coeficiente de amortecimento: %.4f\n', zeta);
fprintf('Frequência natural amortecida: %.4f rad/s\n', wd);
fprintf('Frequência natural: %.4f rad/s\n', wn);

fprintf('\nFunção de transferência:\n');
G

fprintf('Polos:\n');
disp(polos);

fprintf('Zeros:\n');
if isempty(zerosSistema)
    fprintf('O sistema não possui zeros finitos.\n');
else
    disp(zerosSistema);
end

fprintf('Natureza da resposta: %s\n', natureza);

%% Comparação entre os dados e o modelo calculado
[yModelo, tModelo] = step(G, t);

figure;
plot(t, y, 'o', 'LineWidth', 1.2);
hold on;
plot(tModelo, yModelo, 'LineWidth', 1.5);

yline(valorFinal, '--', 'Valor final');
yline(limiteSuperior, ':', 'Limite de +2%');
yline(limiteInferior, ':', 'Limite de -2%');

grid on;
xlabel('Tempo (s)');
ylabel('Saída y(t)');
title('Resposta ao degrau unitário');
legend('Dados da tabela', 'Modelo calculado', ...
       'Location', 'best');

%% Mapa de polos e zeros
figure;
pzmap(G);
grid on;
title('Mapa de polos e zeros');
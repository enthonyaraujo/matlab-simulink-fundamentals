%% 08 - Polos e zeros
% Script independente.
clear;
clc;
close all;

fprintf('=== Determinação de polos e zeros ===\n\n');

% G(s) = (4s^2 + 16s + 12) /
%        (s^4 + 12s^3 + 44s^2 + 48s)
num = [4 16 12];
den = [1 12 44 48 0];

zeros_sistema = roots(num);
polos_sistema = roots(den);
ganho = num(1) / den(1);

disp('Zeros do sistema:');
disp(zeros_sistema);

disp('Polos do sistema:');
disp(polos_sistema);

fprintf('Ganho = %.4f\n\n', ganho);

num_rec = ganho * poly(zeros_sistema);
den_rec = poly(polos_sistema);

tol = 1e-10;
num_rec(abs(num_rec) < tol) = 0;
den_rec(abs(den_rec) < tol) = 0;

disp('Numerador reconstruído:');
disp(num_rec);

disp('Denominador reconstruído:');
disp(den_rec);

figure('Name', 'Mapa de polos e zeros');
hold on;
grid on;
axis equal;

plot(real(zeros_sistema), imag(zeros_sistema), 'o', ...
    'MarkerSize', 9, 'LineWidth', 1.5);
plot(real(polos_sistema), imag(polos_sistema), 'x', ...
    'MarkerSize', 10, 'LineWidth', 1.5);

xline(0);
yline(0);
xlabel('Parte real');
ylabel('Parte imaginária');
title('Mapa de polos e zeros');
legend('Zeros', 'Polos', 'Location', 'best');
hold off;

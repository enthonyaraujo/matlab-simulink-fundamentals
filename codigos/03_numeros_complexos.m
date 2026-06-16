%% 03 - Números complexos
% Script independente.
clear;
clc;

fprintf('=== Números complexos ===\n\n');

z = 2 + 3i;

parte_real = real(z);
parte_imaginaria = imag(z);
magnitude = abs(z);
angulo_rad = angle(z);
angulo_graus = angulo_rad * 180 / pi;

fprintf('z = %.2f %+.2fi\n', parte_real, parte_imaginaria);
fprintf('Parte real = %.4f\n', parte_real);
fprintf('Parte imaginária = %.4f\n', parte_imaginaria);
fprintf('Magnitude = %.4f\n', magnitude);
fprintf('Ângulo = %.4f rad\n', angulo_rad);
fprintf('Ângulo = %.4f graus\n\n', angulo_graus);

z_reconstruido = magnitude * exp(1i * angulo_rad);
fprintf('Forma polar reconstruída: %.2f %+.2fi\n\n', ...
    real(z_reconstruido), imag(z_reconstruido));

z1 = 1 + 2i;
z2 = 3 - 4i;

soma = z1 + z2;
produto = z1 * z2;

fprintf('z1 + z2 = %.2f %+.2fi\n', real(soma), imag(soma));
fprintf('z1 * z2 = %.2f %+.2fi\n', real(produto), imag(produto));
fprintf('conj(z1) = %.2f %+.2fi\n', real(conj(z1)), imag(conj(z1)));

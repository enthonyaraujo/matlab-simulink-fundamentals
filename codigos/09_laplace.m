%% 09 - Transformada de Laplace direta e inversa
% Script independente.
% Requer Symbolic Math Toolbox.
clear;
clc;

if exist('syms', 'file') == 0
    error('Este script requer a Symbolic Math Toolbox.');
end

fprintf('=== Transformada de Laplace ===\n\n');

syms t s

% Transformada direta
f = 2*exp(-3*t) - exp(-5*t);
F = simplify(laplace(f, t, s));

disp('Função no domínio do tempo:');
disp(f);

disp('Transformada de Laplace F(s):');
pretty(F);

% Transformada inversa
F_inversa = 5 + 6/(s + 4) - (7*s)/(s^2 + 25);
f_inversa = simplify(ilaplace(F_inversa, s, t));

disp('Função no domínio de Laplace:');
pretty(F_inversa);

disp('Transformada inversa f(t):');
pretty(f_inversa);

% Verificação
F_verificacao = simplify(laplace(f_inversa, t, s));
erro = simplify(F_verificacao - F_inversa);

disp('Erro simbólico da verificação:');
disp(erro);

if isequal(erro, sym(0))
    disp('Verificação concluída: a transformação está correta.');
end

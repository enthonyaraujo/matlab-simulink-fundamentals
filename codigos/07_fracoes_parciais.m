%% 07 - Expansão em frações parciais
% Script independente.
clear;
clc;

if exist('residue', 'file') == 0
    error(['A função residue não foi encontrada. Verifique se a toolbox ', ...
           'necessária está instalada.']);
end

fprintf('=== Expansão em frações parciais ===\n\n');

% F(s) = (5s + 3) / [s(s + 1)(s + 2)]
num = [5 3];
den = conv([1 0], conv([1 1], [1 2]));

disp('Numerador:');
disp(num);

disp('Denominador:');
disp(den);

[r, p, k] = residue(num, den);

disp('Resíduos:');
disp(r);

disp('Polos:');
disp(p);

disp('Termo direto:');
disp(k);

[num_rec, den_rec] = residue(r, p, k);

num_rec = num_rec / den_rec(1);
den_rec = den_rec / den_rec(1);

disp('Numerador reconstruído:');
disp(num_rec);

disp('Denominador reconstruído:');
disp(den_rec);

fprintf('\nExpansão aproximada:\n');
for i = 1:numel(r)
    fprintf('(%+.6f) / (s - (%+.6f))\n', r(i), p(i));
end

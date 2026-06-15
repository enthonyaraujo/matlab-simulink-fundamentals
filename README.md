# MATLAB e Simulink - Sistemas de Controle 

## Sumário

1. [Introdução ao MATLAB](#1-introdução-ao-matlab)
2. [Ambiente do MATLAB](#2-ambiente-do-matlab)
3. [Operações básicas e variáveis](#3-operações-básicas-e-variáveis)
4. [Funções de transferência](#4-funções-de-transferência)
5. [Expansão em frações parciais](#5-expansão-em-frações-parciais)
6. [Zeros e polos](#6-zeros-e-polos)
7. [Transformada de Laplace](#7-transformada-de-laplace)
8. [Resposta temporal](#8-resposta-temporal)
9. [Diagramas de blocos](#9-diagramas-de-blocos)
10. [Modelos no Simulink](#10-modelos-no-simulink)
11. [Resumo dos principais comandos](#11-resumo-dos-principais-comandos)

---

## 1. Introdução ao MATLAB

MATLAB significa **MATrix LABoratory**. É um ambiente computacional voltado principalmente para:

- cálculos numéricos;
- manipulação de vetores e matrizes;
- construção de gráficos;
- análise de sistemas dinâmicos;
- processamento de sinais;
- identificação de sistemas;
- controle clássico, moderno e robusto;
- otimização;
- simulação de sistemas por meio do Simulink.

No MATLAB, os dados são tratados principalmente como matrizes. Mesmo um número escalar pode ser interpretado como uma matriz de dimensão $1 \times 1$.

### Vantagem principal

Problemas matemáticos podem ser escritos de forma próxima à notação utilizada em engenharia, sem a necessidade de implementar todos os algoritmos numéricos manualmente.

---

## 2. Ambiente do MATLAB

As principais áreas da interface são:

### Command Window

Janela utilizada para executar comandos diretamente.

```matlab
2 + 3
```

Saída:

```text
ans =
     5
```

### Workspace

Exibe as variáveis atualmente armazenadas na memória, seus valores, tipos e dimensões.

### Current Folder

Mostra os arquivos presentes na pasta de trabalho atual.

### Editor

Usado para criar e editar scripts e funções, geralmente em arquivos com extensão `.m`.

### Figure

Janela onde são mostrados gráficos e resultados visuais.

---

## 3. Operações básicas e variáveis

### 3.1 Símbolos e comandos básicos

| Comando ou símbolo | Função |
|---|---|
| `;` | Suprime a impressão do resultado |
| `%` | Inicia um comentário |
| `...` | Continua um comando na linha seguinte |
| `ans` | Armazena o resultado do último comando sem atribuição |
| `Inf` | Representa infinito |
| `NaN` | Representa um resultado numérico indefinido |
| `Ctrl + C` | Interrompe a execução atual |
| `clc` | Limpa a Command Window |
| `clear` | Remove variáveis do Workspace |
| `close all` | Fecha todas as janelas de gráficos |

É comum iniciar um script com:

```matlab
close all;
clear;
clc;
```

### 3.2 Operações aritméticas

| Operação | MATLAB |
|---|---|
| Adição | `a + b` |
| Subtração | `a - b` |
| Multiplicação matricial | `a * b` |
| Divisão à direita | `a / b` |
| Divisão à esquerda | `a \ b` |
| Potenciação | `a ^ b` |

### Hierarquia das operações

A ordem de prioridade é:

1. parênteses;
2. exponenciação;
3. multiplicação e divisão;
4. adição e subtração.

Exemplo:

```matlab
4^2 * 250 + 2 * 100
```

Resultado:

```text
4200
```

Com parênteses:

```matlab
4^2 * (250 + 2) * 100
```

Resultado:

```text
403200
```

### 3.3 Variáveis

O MATLAB diferencia letras maiúsculas de minúsculas.

```matlab
valor = 10;
Valor = 20;
```

As variáveis `valor` e `Valor` são diferentes.

Para nomes compostos, pode-se usar sublinhado:

```matlab
custo_total = 92;
```

Exemplo:

```matlab
parafusos = 12;
porcas = 8;
itens = parafusos + porcas;
custo_total = parafusos * 5 + porcas * 4;
```

### 3.4 Números complexos

Um número complexo pode ser escrito usando `i` ou `j`:

```matlab
z = 2 + 3i;
```

A forma retangular é:

$$
z = a + jb
$$

A magnitude é:

$$
|z| = \sqrt{a^2+b^2}
$$

O ângulo é:

$$
\theta = \tan^{-1}\left(\frac{b}{a}\right)
$$

No MATLAB:

```matlab
z = 2 + 3i;
modulo = abs(z);
angulo_rad = angle(z);
angulo_graus = rad2deg(angulo_rad);
```

Conversão entre as formas polar e retangular:

```matlab
[x, y] = pol2cart(angulo_rad, modulo);
[angulo_rad, modulo] = cart2pol(x, y);
```

### 3.5 Funções matemáticas importantes

#### Trigonométricas

```matlab
sin(x)
cos(x)
tan(x)
asin(x)
acos(x)
atan(x)
```

#### Exponenciais e logarítmicas

```matlab
exp(x)
log(x)      % logaritmo natural
log10(x)    % logaritmo na base 10
sqrt(x)
```

#### Números complexos

```matlab
abs(z)
angle(z)
conj(z)
real(z)
imag(z)
```

#### Numéricas

```matlab
round(x)
rem(a,b)
sign(x)
```

### 3.6 Vetores

#### Vetor definido explicitamente

```matlab
x = [2, 2*pi, sqrt(2), 2-3i];
```

#### Operador dois-pontos

```matlab
x = 1:5;
```

Resultado:

```text
x = [1 2 3 4 5]
```

Com incremento definido:

```matlab
x = 0:0.5:2;
```

Resultado:

```text
x = [0 0.5 1.0 1.5 2.0]
```

#### `linspace`

Cria um vetor com quantidade definida de pontos igualmente espaçados:

```matlab
x = linspace(0, 10, 6);
```

Resultado:

```text
x = [0 2 4 6 8 10]
```

### 3.7 Matrizes

Uma matriz pode ser criada separando:

- elementos da mesma linha por espaços ou vírgulas;
- linhas diferentes por ponto e vírgula.

```matlab
A = [1 2 3;
     4 5 6;
     7 8 9];
```

Também é possível escrever:

```matlab
A = [1,2,3; 4,5,6; 7,8,9];
```

### Operações matriciais e elemento a elemento

| Operação | Matricial | Elemento a elemento |
|---|---|---|
| Multiplicação | `A * B` | `A .* B` |
| Divisão à direita | `A / B` | `A ./ B` |
| Divisão à esquerda | `A \ B` | `A .\ B` |
| Potenciação | `A ^ n` | `A .^ n` |

Exemplo:

```matlab
A = [1 2; 3 4];
B = [5 6; 7 8];

produto_matricial = A * B;
produto_elemento = A .* B;
```

> O ponto antes do operador indica que a operação será executada elemento por elemento.

---

## 4. Funções de transferência

Uma função de transferência é definida por:

$$
G(s)=\frac{Y(s)}{U(s)}
$$

considerando condições iniciais nulas.

No MATLAB, a função `tf` cria modelos de função de transferência.

### 4.1 Usando vetores de coeficientes

Para:

$$
G(s)=\frac{s+5}{s^2+3s+2}
$$

utiliza-se:

```matlab
num = [1 5];
den = [1 3 2];
G = tf(num, den)
```

### 4.2 Criando diretamente

```matlab
G = tf([1 5], [1 3 2]);
```

### 4.3 Usando a variável simbólica de função de transferência

```matlab
s = tf('s');
G = (s + 5)/(s^2 + 3*s + 2);
```

### 4.4 Exemplo: circuito elétrico RLC

Considere um circuito com:

- $R = 10\ \Omega$;
- $L = 20\ \text{mH}$;
- $C = 3\ \mu\text{F}$;
- saída medida sobre o capacitor.

A função de transferência é:

$$
\frac{V_s(s)}{V_e(s)}=
\frac{\frac{1}{LC}}
{s^2+\frac{R}{L}s+\frac{1}{LC}}
$$

Código:

```matlab
close all;
clear;
clc;

L = 20e-3;
R = 10;
C = 3e-6;

num = [1/(L*C)];
den = [1 R/L 1/(L*C)];

G = tf(num, den)
```

### 4.5 Exemplo: sistema massa-mola-amortecedor

Para um sistema mecânico com:

- massa $m$;
- amortecimento viscoso $b$;
- constante da mola $k$;
- entrada $u(t)$ igual à força;
- saída $y(t)$ igual ao deslocamento.

A equação diferencial é:

$$
m\ddot y(t)+b\dot y(t)+ky(t)=u(t)
$$

A função de transferência correta é:

$$
\frac{Y(s)}{U(s)}=
rac{1}{ms^2+bs+k}
$$

Dividindo o denominador por $m$:

$$
\frac{Y(s)}{U(s)}=
\frac{\frac{1}{m}}
{s^2+\frac{b}{m}s+\frac{k}{m}}
$$

Para $m=10$, $k=20$ e $b=4$:

```matlab
close all;
clear;
clc;

m = 10;
k = 20;
b = 4;

num = [1/m];
den = [1 b/m k/m];

G = tf(num, den)
```

Forma equivalente:

```matlab
G = tf([1], [m b k]);
```

---

## 5. Expansão em frações parciais

A expansão em frações parciais é útil para calcular transformadas inversas de Laplace e analisar a contribuição de cada polo.

O MATLAB utiliza:

```matlab
[r, p, k] = residue(num, den);
```

onde:

- `r`: resíduos;
- `p`: polos;
- `k`: termo direto, quando o grau do numerador é maior ou igual ao do denominador.

Considere:

$$
F(s)=\frac{2s^3+5s^2+3s+6}{s^3+6s^2+11s+6}
$$

Código:

```matlab
num = [2 5 3 6];
den = [1 6 11 6];

[r, p, k] = residue(num, den)
```

Resultado equivalente:

$$
F(s)=\frac{-6}{s+3}+\frac{-4}{s+2}+\frac{3}{s+1}+2
$$

Para retornar à forma polinomial:

```matlab
[num_original, den_original] = residue(r, p, k);
```

---

## 6. Zeros e polos

### Definições

- **Zeros:** valores de $s$ que anulam o numerador.
- **Polos:** valores de $s$ que anulam o denominador.
- **Ganho:** constante multiplicativa associada à representação em polos, zeros e ganho.

A conversão de função de transferência para polos, zeros e ganho é feita por:

```matlab
[z, p, k] = tf2zp(num, den);
```

O processo inverso utiliza:

```matlab
[num, den] = zp2tf(z, p, k);
```

### Exemplo

Considere:

$$
G(s)=\frac{4s^2+16s+12}{s^4+12s^3+44s^2+48s}
$$

Código:

```matlab
num = [0 0 4 16 12];
den = [1 12 44 48 0];

[z, p, k] = tf2zp(num, den)
```

Resultados:

```text
z = [-1; -3]
p = [0; -2; -4; -6]
k = 4
```

Logo:

$$
G(s)=\frac{4(s+1)(s+3)}{s(s+2)(s+4)(s+6)}
$$

Retornando à função original:

```matlab
[num2, den2] = zp2tf(z, p, k);
G2 = tf(num2, den2)
```

### Representação `zpk`

```matlab
Gzpk = zpk(z, p, k);
```

Também é possível converter uma função existente:

```matlab
s = tf('s');
G = (4*s^2 + 16*s + 12)/(s^4 + 12*s^3 + 44*s^2 + 48*s);
Gzpk = zpk(G)
```

### Mapa de polos e zeros

```matlab
pzmap(G);
grid on;
```

No gráfico:

- círculos representam zeros;
- cruzes representam polos.

---

## 7. Transformada de Laplace

Para cálculos simbólicos, utiliza-se o **Symbolic Math Toolbox**.

### 7.1 Transformada direta

```matlab
syms t s
f = 4*exp(-2*t);
F = laplace(f, t, s);
pretty(F)
```

Resultado:

$$
F(s)=\frac{4}{s+2}
$$

### 7.2 Transformada inversa

```matlab
syms t s
F = 4/(s+2);
f = ilaplace(F, s, t);
pretty(f)
```

Resultado:

$$
f(t)=4e^{-2t}
$$

### 7.3 Atividade 1 — Transformada direta

Determine:

$$
f(t)=2e^{-3t}-e^{-5t}
$$

Código:

```matlab
syms t s
f = 2*exp(-3*t) - exp(-5*t);
F = simplify(laplace(f, t, s))
```

Resultado:

$$
F(s)=\frac{2}{s+3}-\frac{1}{s+5}
$$

ou:

$$
F(s)=\frac{s+7}{s^2+8s+15}
$$

### 7.4 Atividade 2 — Transformada inversa

Determine a transformada inversa de:

$$
F(s)=\frac{s+7}{s^2+2s+5}
$$

Completando o quadrado:

$$
s^2+2s+5=(s+1)^2+4
$$

Separando o numerador:

$$
s+7=(s+1)+6
$$

Logo:

$$
F(s)=\frac{s+1}{(s+1)^2+2^2}
+3\frac{2}{(s+1)^2+2^2}
$$

Assim:

$$
f(t)=e^{-t}\cos(2t)+3e^{-t}\sin(2t)
$$

Código:

```matlab
syms s t
F = (s + 7)/(s^2 + 2*s + 5);
f = simplify(ilaplace(F, s, t))
```

---

## 8. Resposta temporal

A resposta temporal mostra como a saída do sistema evolui ao longo do tempo para uma entrada especificada.

### 8.1 Resposta ao degrau unitário

Para:

$$
G(s)=\frac{s+1}{s^2+3s+1}
$$

Código:

```matlab
num = [1 1];
den = [1 3 1];
G = tf(num, den);

step(G);
grid on;
title('Resposta ao degrau unitário');
xlabel('Tempo (s)');
ylabel('Saída y(t)');
```

### Outros comandos úteis

```matlab
impulse(G)   % resposta ao impulso
initial(G)   % resposta às condições iniciais, em modelos de estados
lsim(G,u,t)  % resposta a uma entrada arbitrária u(t)
```

Exemplo com uma entrada senoidal:

```matlab
t = 0:0.01:10;
u = sin(2*t);
lsim(G, u, t);
grid on;
```

---

## 9. Diagramas de blocos

Sistemas podem ser combinados em:

- série;
- paralelo;
- realimentação.

### 9.1 Realimentação

Para um sistema direto $G(s)$ e um sistema de realimentação $H(s)$, a função de transferência em malha fechada com realimentação negativa é:

$$
T(s)=\frac{G(s)}{1+G(s)H(s)}
$$

No MATLAB:

```matlab
T = feedback(G, H);
```

Por padrão, `feedback(G,H)` considera realimentação negativa.

Para especificar o sinal:

```matlab
Tneg = feedback(G, H, -1); % negativa
Tpos = feedback(G, H,  1); % positiva
```

### Exemplo

Considere:

$$
G(s)=\frac{s+1}{s(s+2)(s+3)}
$$

com realimentação unitária negativa, $H(s)=1$.

```matlab
s = tf('s');
G = (s + 1)/(s*(s + 2)*(s + 3));
H = 1;

T = feedback(G, H)
```

Resultado:

$$
T(s)=\frac{s+1}{s^3+5s^2+7s+1}
$$

Usando vetores:

```matlab
num1 = [1 1];
den1 = conv([1 0], conv([1 2], [1 3]));

num2 = [1];
den2 = [1];

[num, den] = feedback(num1, den1, num2, den2, -1);
T = tf(num, den)
```

### 9.2 Sistemas em série

Para dois sistemas em cascata:

$$
G_{eq}(s)=G_1(s)G_2(s)
$$

No MATLAB:

```matlab
Geq = series(G1, G2);
```

ou simplesmente:

```matlab
Geq = G1 * G2;
```

#### Atividade — sistemas em série

$$
G_1(s)=\frac{1}{2{,}62s+1}
$$

$$
G_2(s)=\frac{1}{0{,}38s+1}
$$

A função equivalente é:

$$
\frac{Y_2(s)}{U_1(s)}=G_1(s)G_2(s)
$$

O denominador é:

$$
(2{,}62s+1)(0{,}38s+1)
=0{,}9956s^2+3s+1
$$

Aproximando $0{,}9956$ para $0{,}996$:

$$
\frac{Y_2(s)}{U_1(s)}=
\frac{1}{0{,}996s^2+3s+1}
$$

Código:

```matlab
G1 = tf(1, [2.62 1]);
G2 = tf(1, [0.38 1]);

Geq = series(G1, G2)
```

### 9.3 Sistemas em paralelo

Para dois sistemas em paralelo com soma das saídas:

$$
G_{eq}(s)=G_1(s)+G_2(s)
$$

No MATLAB:

```matlab
Geq = parallel(G1, G2);
```

ou:

```matlab
Geq = G1 + G2;
```

#### Atividade — sistemas em paralelo

Para os mesmos sistemas:

$$
G_1(s)=\frac{1}{2{,}62s+1}
$$

$$
G_2(s)=\frac{1}{0{,}38s+1}
$$

Temos:

$$
\frac{Y(s)}{U(s)}=G_1(s)+G_2(s)
$$

Somando:

$$
G_{eq}(s)=
\frac{(0{,}38s+1)+(2{,}62s+1)}
{(2{,}62s+1)(0{,}38s+1)}
$$

Logo:

$$
G_{eq}(s)=\frac{3s+2}{0{,}9956s^2+3s+1}
$$

Código:

```matlab
G1 = tf(1, [2.62 1]);
G2 = tf(1, [0.38 1]);

Geq = parallel(G1, G2)
```

---

## 10. Modelos no Simulink

O Simulink permite representar sistemas dinamicamente por diagramas de blocos.

Elementos comuns:

- **Inport:** entrada do modelo;
- **Outport:** saída do modelo;
- **Sum:** somador ou comparador de sinais;
- **Gain:** ganho constante;
- **Transfer Fcn:** função de transferência;
- **Scope:** visualização do sinal;
- **Step:** entrada degrau.

### 10.1 Extração de modelo em espaço de estados

Nos exemplos dos slides, o modelo é linearizado com:

```matlab
[A, B, C, D] = linmod('Exemplo1');
```

Em seguida, cria-se o modelo de espaço de estados:

```matlab
sys = ss(A, B, C, D);
```

A conversão para função de transferência é feita por:

```matlab
G = tf(sys)
```

### 10.2 Obtenção do numerador e denominador

```matlab
[num, den] = ss2tf(A, B, C, D);
```

### 10.3 Exemplo de realimentação com ganho

Considere o diagrama formado por:

- ganho direto igual a $10$;
- bloco direto $1/(s+1)$;
- bloco de realimentação $1/(s+2)$;
- realimentação negativa.

O ramo direto é:

$$
G(s)=\frac{10}{s+1}
$$

A realimentação é:

$$
H(s)=\frac{1}{s+2}
$$

A função em malha fechada é:

$$
T(s)=\frac{G(s)}{1+G(s)H(s)}
$$

Substituindo:

$$
T(s)=
\frac{\frac{10}{s+1}}
{1+\frac{10}{(s+1)(s+2)}}
$$

Portanto:

$$
T(s)=\frac{10(s+2)}{(s+1)(s+2)+10}
$$

$$
T(s)=\frac{10s+20}{s^2+3s+12}
$$

Código equivalente no MATLAB:

```matlab
s = tf('s');
G = 10/(s + 1);
H = 1/(s + 2);

T = feedback(G, H)
```

---

## 11. Resumo dos principais comandos

| Objetivo | Comando |
|---|---|
| Limpar a tela | `clc` |
| Limpar variáveis | `clear` |
| Fechar gráficos | `close all` |
| Criar função de transferência | `tf(num,den)` |
| Criar variável $s$ | `s = tf('s')` |
| Criar modelo polos-zeros-ganho | `zpk(z,p,k)` |
| Criar modelo de estados | `ss(A,B,C,D)` |
| Frações parciais | `[r,p,k] = residue(num,den)` |
| Obter zeros, polos e ganho | `[z,p,k] = tf2zp(num,den)` |
| Voltar para coeficientes | `[num,den] = zp2tf(z,p,k)` |
| Mapa de polos e zeros | `pzmap(G)` |
| Transformada de Laplace | `laplace(f)` |
| Transformada inversa | `ilaplace(F)` |
| Resposta ao degrau | `step(G)` |
| Resposta ao impulso | `impulse(G)` |
| Simulação com entrada arbitrária | `lsim(G,u,t)` |
| Associação em série | `series(G1,G2)` ou `G1*G2` |
| Associação em paralelo | `parallel(G1,G2)` ou `G1+G2` |
| Realimentação | `feedback(G,H)` |
| Conversão estados para FT | `tf(sys)` |
| Estados para vetores da FT | `ss2tf(A,B,C,D)` |

---

## Script geral de revisão

```matlab
close all;
clear;
clc;

%% Função de transferência
s = tf('s');
G = (s + 1)/(s^2 + 3*s + 1);

%% Informações do sistema
pole(G)
zero(G)
dcgain(G)

%% Mapa de polos e zeros
figure;
pzmap(G);
grid on;
title('Mapa de polos e zeros');

%% Resposta ao degrau
figure;
step(G);
grid on;
title('Resposta ao degrau');

%% Representação em polos, zeros e ganho
Gzpk = zpk(G)

%% Realimentação unitária negativa
T = feedback(G, 1)

%% Resposta do sistema em malha fechada
figure;
step(T);
grid on;
title('Resposta em malha fechada');
```

---

## Observações importantes

1. Os coeficientes dos polinômios devem ser escritos em ordem decrescente das potências de $s$ .
2. Coeficientes ausentes devem ser representados por zero.
3. `*`, `/` e `^` representam operações matriciais.
4. `.*`, `./` e `.^` representam operações elemento a elemento.
5. Para usar `tf`, `zpk`, `ss`, `step`, `feedback` e funções relacionadas, é necessário o **Control System Toolbox**.
6. Para usar `syms`, `laplace` e `ilaplace`, é necessário o **Symbolic Math Toolbox**.
7. Em sistemas mecânicos, confira sempre a direção da razão entrada/saída. Para força como entrada e deslocamento como saída, utiliza-se $Y(s)/U(s)$.
8. Antes de confiar no resultado numérico, verifique se a função de transferência obtida é coerente com o modelo físico e com as unidades do problema.

---

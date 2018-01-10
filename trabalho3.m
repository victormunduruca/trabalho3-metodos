%Matheus Teixeira dos Santos e Victor Munduruca Gomes Santos
%EXA862 - M?todos Num?ricos
%Departamento de Ci?ncias Exatas
%Universidade Estadual de Feira de Santana
format shortEng
% x = [0, 1, 2, 3, 4, 5];
% m = 2;
% y = [2.1 7.7 13.6 27.2 40.9 61.1];

%Amostras x e y.
x = [50, 80, 130, 200, 250, 350, 450, 550, 700];
y = [99, 177, 202, 248, 229, 219, 173, 142, 72];

%Ordem do polin?mio desejado
m = 3;

regressaoPolinomial(x, y, m);
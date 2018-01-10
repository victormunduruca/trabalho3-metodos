%Este codigo implementa uma funcao de regressão polinomial.

function [desviopadrao, coeficientes, residuos, SSE, R] = regressaoPolinomial(x, y, m)    
    
    %Inicializacao das matrizes relacionadas as equações normais.
    matriz = zeros(m+1,m+1);
    independentes = zeros(m+1,1);
    
    %Verificacao da condicao de tamanhos iguais das amostras x e y.
    if length(x) != length(y)
        error('As amostras x e y devem ter tamanhos iguais para execucao do metodo.');
    end
   
    %Verificacao da condicao do grau do polinomio ser menor ou igual ao tamanho do vetor x. 
    if m > length(x) 
        error ('Nao existem dados suficientes para um polinomio do grau desejado');
    end
    
    potencias = zeros(2*m+1,1);    
    for k = 0:(2*m)
        potencias(k+1) = sum(x.^k); 
    end
    
    for k = 0:m
        independentes(k+1) = sum(y.*(x.^k)); 
    end
    
    for k = 0:m
        matriz(k+1,:) = potencias((k+1):(k+1+m)); 
    end
    
    %Calculo dos coeficientes 'a' da curva ajustada.
    coeficientes = matriz\independentes; 
    
    %Calculo do desvio padrao.
    desviopadrao = std(y);
    
    xx = 0:0.1:max(x);    
    yy = zeros(1,length(xx));
    for k = 1:length(yy) 
        for l = 0:m
            yy(k) = yy(k) + coeficientes(l+1)*(xx(k))^l;
        end
    end
   
    
    yy = zeros(1,length(x)); 
    residuos = zeros(1,length(x));
    for k = 1:length(x) 
        for l = 0:m
            yy(k) = yy(k) + coeficientes(l+1)*(x(k))^l;
        end
        residuos(k) = y(k) - yy(k);
    end
   
    SSE = sum(residuos.^2);
    %Calculo do erro padrao.
    erropadrao = sqrt(SSE/(length(x) - (m+1)));
    
    quadradodesvios = var(y)*length(y);
    
    %Calculo do coeficiente de determinacao.
    coefdet = (quadradodesvios - SSE)/quadradodesvios;

    % Exibição dos resultados
    printf("REGRESSAO POLINOMIAL\n");
    
    printf("Coeficiente das equacoes normais:\n");
    disp(matriz);
    
    printf("\nTermos independentes das equacoes normais:\n");
    disp(independentes);
    
    printf("\nOs coeficientes do polinomio sao:\n");
    disp(coeficientes);
    
    printf("\nO desvio padrao para este caso e:");
    disp(desviopadrao);
    
    printf("O erro-padrao da estimativa para este caso foi:");
    disp(erropadrao);
    
    printf("O coeficiente de determinacao para este caso foi:");
    disp(coefdet);
    
    if coefdet != 0
      printf("\nNeste caso houve melhora ao realizar o ajuste.");
    else
      printf("\nNeste caso nao houve melhora ao realizar o ajuste.");
    end
 
    printf(["\nCom a aplicacao deste metodo de regressao polinomial, foi explicado ", num2str(coefdet*100),"\nda incerteza em relacao a amostra."]);

end
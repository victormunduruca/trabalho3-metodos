function [desviopadrao, coeficientes, residuos, SSE, R] = regressaoPolinomial(x, y, m)    
    matriz = zeros(m+1,m+1);
    independentes = zeros(m+1,1);
    
    if m > length(x) 
        error ('There is not enought data for the polynom of required m');
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
    
    coeficientes = matriz\independentes; 
    
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
    erropadrao = sqrt(SSE/(length(x) - (m+1)));
    quadradodesvios = var(y)*length(y);
    coefdet = (quadradodesvios - SSE)/quadradodesvios;

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

end
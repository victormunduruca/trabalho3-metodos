x = [0, 1, 2, 3, 4, 5];
m = 2;
y = [2.1 7.7 13.6 27.2 40.9 61.1];

% x = [50, 80, 130, 200, 250, 350, 450, 550, 700];
% m = 3;
% y = [99, 177, 202, 248, 229, 219, 173, 142, 72];

regressaoPolinomial(x, y, m);

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
    disp(erropadrao);
    quadradodesvios = var(y)*length(y);
    coefdet = (quadradodesvios - SSE)/quadradodesvios;
    disp(coefdet);
    disp(SSE);
end
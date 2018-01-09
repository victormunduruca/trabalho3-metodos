function [p] = regressaoPolinominal(x, y, m)
    if (size(x) < m +1)
        fprintf('A regressao polinominal e impossivel');
        return
    end
endfunction
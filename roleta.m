function ind = roleta(FX, tamPOP)
  F = 1.1 * max(FX) - FX;
  F = F / sum(F);
  ind = zeros(tamPOP, 1);

  for j = 1:(tamPOP)
    r = rand;
    cont = 0;
    somaProbabilidade = 0;
    while (somaProbabilidade <= r)
      cont = cont + 1;
      somaProbabilidade = somaProbabilidade + F(cont);
    endwhile
    ind(j) = cont;
  end

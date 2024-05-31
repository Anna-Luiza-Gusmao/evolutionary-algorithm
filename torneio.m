function ind = torneio(FX, tamPOP)
  numPOP = size(FX, 1);
  ind = zeros(tamPOP, 1);
  for i=1:tamPOP
    r = randperm(numPOP, 2);
    if (rand <= 0.9)
      if (FX(r(1)) <= FX(r(2)))
        ind(i) = r(1);
      else
        ind(i) = r(2);
      endif
    else
      if (FX(r(1)) <= FX(r(2)))
        ind(i) = r(2);
      else
        ind(i) = r(1);
      endif
    endif
  endfor


function POPnovo = cruzamento(POP)
  tamPOP = size(POP, 1);
  numVAR = size(POP, 2);
  POPnovo = zeros(tamPOP, numVAR);

  for i = 1:tamPOP
    paisAleatorios = randperm(tamPOP,numVAR);
    pais = POP(paisAleatorios, :);

    filhos = zeros(1, numVAR);

    for j = 1:numVAR
      pais_idx = paisAleatorios(j);
      pai = POP(pais_idx, :);
      filhos(j) = pai(j) + (2 * rand - 1) * (mean(pais(:, j)) - pai(j));
    end

    POPnovo(i, :) = filhos;
  end
end

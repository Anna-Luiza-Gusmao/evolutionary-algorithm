function POPnovo = mutacao(POPnovo, xmax, xmin, progress)
  for i = 1:size(POPnovo, 1)
    for j = 1:size(POPnovo, 2)
      valor_aleatorio = rand;
      if valor_aleatorio < 0.5
        POPnovo(i, j) = POPnovo(i, j) + (rand - 0.5) * (xmax - xmin) * max(0.1, 1 - progress);
      end
    end
  end

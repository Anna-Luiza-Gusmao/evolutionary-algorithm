clear all;
close all;
clc;

function [minFX] = main(numVAR, tamPOP, numGER)
  xmin = -5.12;
  xmax = 5.12;
  tamElite = round(tamPOP * 0.3);

  % Gerando a população inicial
  POP = xmin + (xmax-xmin) * rand(tamPOP,numVAR);
  FX = calculaFX(POP);

  P = xmin:0.1:xmax;
  FXX = calculaFX(POP);

  for g = 1:numGER
    progress = g / numGER;

    % Cruzamento
    POPnovo = cruzamento(POP);
    % Garante que os novos indivíduos não ultrapassem os limites do espaço de busca
    POPnovo = min(POPnovo,xmax);
    POPnovo = max(POPnovo,xmin);

    % Mutação
    POPnovo = mutacao(POPnovo, xmax, xmin, progress);
    % Garante que os novos indivíduos não ultrapassem os limites do espaço de busca
    POPnovo = min(POPnovo,xmax);
    POPnovo = max(POPnovo,xmin);

    FXnovo = calculaFX(POPnovo); % Novo Fitness
    POP = [POP; POPnovo];
    FX = [FX; FXnovo];

    % Elitismo
    [~, indE] = sort(FX);
    indE = indE(1:tamElite);

    opSelecao = rand;
    if (opSelecao < 0.5)
      % Torneio
      indT = torneio(FX, tamPOP - tamElite);
      indOpSelecao = [indE;indT]; % Indivíduos selecionados com torneio
    else
      % Roleta
      indR = roleta(FX, tamPOP - tamElite);
      indOpSelecao = [indE;indR]; % Indivíduos selecionados com roleta
    endif

    indSelecionados = indOpSelecao;

    POP = POP(indOpSelecao, :);
    FX = FX(indOpSelecao);
  end

  minFX = min(FX);
  % disp("Valor da função Rastrigin minimizada: "), disp(min(FX))

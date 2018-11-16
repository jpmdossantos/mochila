  disp ( '      ' );
  disp('  -------------------------------------------------');
  maxcap =input(' Escolha a capacidade da mochila =  ');
  disp('  -------------------------------------------------');
  disp ( '      ' );
    disp ( '      ' );
  disp('  -------------------------------------------------');
  maxiter =input(' Escolha o numero maximo de iteracoes =  ');
  disp('  -------------------------------------------------');
  disp ( '      ' );
%--------------------------------------------------------------------------%  
quanttotal = 100;
iterations = 1;
condition = 0;
specs = [10 18 12 14 13 11 8 6; 5 8 7 6 9 5 4 3];%linha 1 = peso, linha 2 = valor
razao = zeros (1,size(specs,2));
for i = 1:size(specs,2)
	razao(i) = specs(2,i)/specs(1,i);
end
[p] = max(razao);
maxfit = sum (specs(2,:));
nitens = size(specs,2);
result = zeros(1,nitens);
fitnesses = zeros (quanttotal,1);
genotipos = zeros (quanttotal, nitens);
for i = 1:(quanttotal)
	for j = 1:nitens
		if rand >= 0.5
			genotipos(i,j)=1;
		end
	end
end
fitmax = zeros(1,maxiter);
fitmed = zeros(1,maxiter);
for i = 1:(size(genotipos,1))
	fitnesses (i) = fitness(genotipos(i,:),specs,maxcap,p);
end


%-------------------------------------------------------------------------%
while (iterations <= maxiter)
	nmedio = 0;
	sumfit = 0;
	offspring = zeros (1,nitens); % inicializa primeira linha

	 for i=1:(quanttotal/2)
		ind1 = roullete(fitnesses);
		ind2 = roullete(fitnesses);
		 candidato1 = genotipos (ind1,:);
	 	 candidato2 = genotipos (ind2,:);
		children = combine (candidato1,candidato2);
		offspring = [offspring; mutation(children)];
	end
	offspring(1,:) = []; %remove a primeira linha de inicialização
	if size(offspring,1) > quanttotal  %pro caso da população ser ímpar, remove o último filho
		offspring(quanttotal,:) = [];
	end
	genotipos = offspring;
	fitmax(1,iterations) = max(fitnesses);
	fitmed(1,iterations) = mean(fitnesses);

	for i = 1:(size(genotipos,1))
		fitnesses (i) = fitness(genotipos(i,:),specs,maxcap,p);
	end



iterations += 1;
end

xiterations = 1:maxiter;

figure(1);
clf;
plot(xiterations,fitmax,xiterations,fitmed);

  [M,I] = max(fitnesses);
disp('  -------------------------------------------------');
disp('  -O maior fitness nessa geracao e:               -');
fitnesses(I)
disp('  -------------------------------------------------');
disp('  -O genotipo com o maior fitness e:              -');
genotipos(I,:)


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
result = zeros(1,8);
fitnesses = zeros (quanttotal,1);
genotipos = zeros (quanttotal, 8);
for i = 1:(quanttotal)
	for j = 1:8
		if rand >= 0.5
			genotipos(i,j)=1;
		end
	end
end
specs = [10 18 12 14 13 11 8 6; 5 8 7 6 9 5 4 3]%linha 1 = peso, linha 2 = valor
razao = zeros (1,size(specs,2));
for i = 1:size(specs,2)
	razao(i) = specs(2,i)/specs(1,i);
end
[p] = max(razao);
ynbaixo=0;
ynmedio = 0;
ynalto = 0;
ynperfect = 0;


%-------------------------------------------------------------------------%
%while (iterations <= itermax)
	nmedio = 0;
	sumfit = 0;
	for i = 1:(size(genotipos,1))
		fitnesses (i) = fitness(genotipos(i,:),specs,maxcap,p);
	 end
	ind1 = roullete(fitnesses);
	ind2 = roullete(fitnesses);
	 candidato1 = genotipos (ind1,:);
 	 candidato2 = genotipos (ind2,:);


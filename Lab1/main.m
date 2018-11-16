  disp ( '      ' );
  disp('  -------------------------------------------------');
  N =input(' Escolha o numero de Rainhas e consequentemente o tamanho do tabuleiro =  ');
  disp('  -------------------------------------------------');
  disp ( '      ' );
    disp ( '      ' );
  disp('  -------------------------------------------------');
  itermax =input(' Escolha o numero maxio de iteracoes =  ');
  disp('  -------------------------------------------------');
  disp ( '      ' );
% ---------------------------------------------------
quanttotal = randi(20,1,1)*N + N;
iterations = 1;
past = 1;
condition = 0;
maxcheques = N*(N-1)/2;
result = zeros(1,N);
fitnesses = zeros (quanttotal,1);
childmortality = zeros(itermax,1);
for i = 1:(quanttotal)
  random = randperm(N);
if i == 1
genotipos = random;
else
  genotipos = [genotipos ; random];

end
end
ynbaixo=0;
ynmedio = 0;
ynalto = 0;
ynperfect = 0;


%-------------------------------------------------------------------------%
while (iterations <= itermax)
  nalto = 0;
  nmedio = 0;
  nbaixo = 0;
  nperfect = 0;
  selection = randperm (quanttotal);
  i = 1;

    if fitness_nq(genotipos(selection(i),:)) <= fitness_nq(genotipos(selection(i+1),:))
        candidato1 = genotipos(selection(i),:);
        candidato2 = genotipos(selection(i+1),:);
    else
        candidato2 = genotipos(selection(i),:);
        candidato1 = genotipos(selection(i+1),:);
    end

  if  fitness_nq(candidato2) > fitness_nq(genotipos(selection(i+2),:))
    if fitness_nq(candidato1) > fitness_nq(genotipos(selection(i+2),:))
      candidato2 = candidato1;
      candidato1 = genotipos(selection(i+2),:);
    else
     candidato2 = genotipos(selection(i+2),:);
    end
  end

  if  fitness_nq(candidato2) > fitness_nq(genotipos(selection(i+3),:))
    if fitness_nq(candidato1) > fitness_nq(genotipos(selection(i+3),:))
     candidato2 = candidato1;
      candidato1 = genotipos(selection(i+3),:);
    else
     candidato2 = genotipos(selection(i+3),:);
    end
  end

  if  fitness_nq(candidato2) > fitness_nq(genotipos(selection(i+4),:))
   if fitness_nq(candidato1) > fitness_nq(genotipos(selection(i+4),:))
     candidato2 = candidato1;
     candidato1 = genotipos(selection(i+4),:);
   else
     candidato2 = genotipos(selection(i+4),:);
   end
  end

  parents = [candidato1 ; candidato2];
  children = CutAndCrossfill_Crossover(parents);
  offspring = mutation(children);

  if i == 1
    matrizfilhos = offspring;
  else
    matrizfilhos = [matrizfilhos;offspring];
  end

  genotipos = [genotipos;  matrizfilhos];

  for i = 1:(size(genotipos,1))
     currfit = fitness_nq(genotipos(i,:));
     fitnesses (i) = currfit;
  end

  [M,I] = max(fitnesses);
  teste1= size(genotipos,1);
    if I == size(genotipos,1)
      childmortality(iterations,1)=childmortality(past,1) + 1;
    else
      childmortality(iterations,1)=childmortality(past,1);
    end

  fitnesses(I) = [];
  genotipos(I,:) = [];



  [M,I] = max(fitnesses);
  teste2 = size(genotipos,1);
    if I == size(genotipos,1)
      childmortality(iterations,1)= childmortality(iterations,1)  + 1;
    end

  fitnesses(I) = [];
  genotipos(I,:) = [];

  for i = 1:size(fitnesses)

    if (fitnesses(i) <= maxcheques) && (fitnesses(i) > 0.1*maxcheques)
      nbaixo = nbaixo +1;
    elseif (fitnesses(i) <= 0.1*maxcheques) && (fitnesses(i) > 0.05*maxcheques)
      nmedio = nmedio +1;
    elseif (fitnesses(i) <= 0.05*maxcheques) && (fitnesses(i) > 0)
      nalto = nalto +1;
    elseif fitnesses(i)==0
      nperfect = nperfect +1;
      condition = 1;
      result = genotipos(i,:);
    end
  end

  ynbaixo = [ynbaixo nbaixo];
  ynmedio = [ynmedio nmedio];
  ynalto = [ynalto nalto];
  ynperfect = [ynperfect nperfect];

  
  past = iterations;
  
  iterations = iterations + 1;

end

ynbaixo(1) = [];
ynmedio(1) = [];
ynalto (1) = [];
ynperfect(1) = [];
xiterations = 1:itermax;

figure(1);
clf;
hold on;
scatter(xiterations,ynbaixo,8,'r','filled');
scatter(xiterations,ynmedio,8,'y','filled');
scatter(xiterations,ynalto,8,'g','filled');
scatter(xiterations,ynperfect,8,'b','filled');
hold off;

figure(2);
clf;

stem(xiterations,childmortality,'filled');

if condition ==1
board = zeros(N,N);
  for i = 1:N
      board(i,result(i))= 1;
  end
board
end
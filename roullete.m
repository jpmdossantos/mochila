function [ indice ] = roullete( fitnesses )
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
    N = size(fitnesses,1);
    sumfit = sum(fitnesses);
	if sumfit > 0
    	fitnorm = fitnesses / sumfit;
	else
	 indice = randi(1,N);
	 return
	end

    pick = rand;
    track = 0;
    indice = 1;
    i = 1;
    while i <= N
        track += fitnorm(i);
        if track >= pick
                indice = i;
                i = N;
        end

        i++;
    end
return
end

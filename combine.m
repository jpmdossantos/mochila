function [ children ] = combine( candidato1, candidato2)
%   Detailed explanation goes here
	N = size(candidato1,2);
	children = [candidato1;candidato2];
	point = randi(N-1);
	if rand <= 0.6	
	children(1,1:point)=candidato1(1,1:point);
	children(1,(point+1):N)=candidato2(1,(point+1):N);
	children(2,1:point)=candidato2(1,1:point);
	children(2,(point+1):N)=candidato1(1,(point+1):N);
	end
end


	


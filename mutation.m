function [ offspring ] = mutation( children )
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
    N = size(children,2);
    offspring = children;
    prob = 0.15;
    if rand <= prob
   	 pos = randi(N);
         offspring(1,pos)=~offspring(1,pos);
    end
    
    if rand <= prob
	    pos = randi(N);
	    offspring(2,pos)=~offspring(2,pos);
    end
    
end

function [ offspring ] = mutation( children )
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
    N = size(children,2);
    if rand <= 0.8;
    pos1 = randi(N);
    pos2 = randi(N);
    temp = children (1,pos1);
    children(1,pos1)=children(1,pos2);
    children(1,pos2)=temp;
    end
    
    
    if rand <= 0.8;
    pos1 = randi(N);
    pos2 = randi(N);
    temp = children (2,pos1);
    children(2,pos1)=children(2,pos2);
    children(2,pos2)=temp;
    end %End of function
    offspring = children;
end
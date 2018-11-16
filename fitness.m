function [fit]=fitness(solution, specs, maxweight, p)
    weight = 0;
    fit = 0;
    penalty = 0;
    n=length(solution);
    for i=1:n
	 if (solution(i)==1)
	   fit += specs(2,i);
	    weight += specs(1,i);
    	end
    end

    if weight > maxweight
	  for i=1:n
		penalty += solution(i)*specs(1,i)-maxweight;
          end
   	 penalty = penalty * p;

	    if penalty > 0
		    penalty = -1*penalty;
	    end
	    fit += penalty;
	    if fit < 0
		    fit = 0;
	    end
    end
    
end

%************************** F4:RASTRIGINSFCN ***************************
%   RASTRIGINSFCN Compute the "Rastrigin" function.
%   The function is usually evaluated on the hypercube xi = [-5.12, 5.12],
%   Global Minimum: F(xx*)=0 , at xx*=(0,...,0)
%
%   Input:      xx = [x1, x2, ..., xd]


function y = ObjFunc(xx)
    global numFunc;
    
    d = length(xx);
    sum = 0;
    for ii = 1:d
        xi = xx(ii);
        sum = sum + ((xi+2.5)^2 - 10*cos(1*pi*xi) +0*xi );     % HomeWork Function
        %sum = sum + (xi^2 - 10*cos(2*pi*xi));                                 % Original Rastrigin Function
    end
    y = 10*d + sum;
    numFunc = numFunc+1;
end
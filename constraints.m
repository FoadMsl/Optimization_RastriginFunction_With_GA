function [c, ceq] = constraints(X)

g1 = (X(1)-3)^2 + (X(2)-2)^2 -3;
g2 = 3 -X(1) - X(2);

% bonds:
g3 = X(1) - 5;
g4 = -X(1) - 5;
g5 = X(2) - 5;
g6 = -X(2) - 5;

% c = [g1 g2];
c = [g1 g2 g3 g4 g5 g6];
ceq = [];

end
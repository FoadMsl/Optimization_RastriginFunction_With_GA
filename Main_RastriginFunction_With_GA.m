% =================================================
%       Main_Code_RastriginFunction_With_GA
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc; clear; close all;

% Function Alignment Lines (2D) =========================
[X1, Y1] = meshgrid(linspace(-5, 5, 101), linspace(-5, 5, 101));
for i = 1:length(X1)
    for j = 1:length(Y1)
        Z(i, j) = ObjFunc([X1(i,j), Y1(i,j)]);
    end
end
figure(2);
contour(X1, Y1, Z, 20)
axis([-5, 5, -5, 5])
hold on

% Main Code - Rastrigin Function With GA ==================
global numFunc;
numFunc = 0;
tic

% Initial Values
imax = 4;
X_optArray = [];
fval_optArray = [];

% % HW4_1
% fun = @ObjFunc;
% nvars = 2;
% A = []; 
% b = []; 
% Aeq = []; 
% beq = []; 
% lb = [-5 -5];
% ub = [5 5]; 
% intcon = [];
% nonlcon = [];

% HW4_2
fun = @ObjFunc;
nvars = 2;
A = []; 
b = []; 
Aeq = []; 
beq = []; 
lb = [];
ub = []; 
intcon = [];
% nonlcon = @constraints;
nonlcon = [];

% for i = 1:imax
    options = optimoptions("ga", "SelectionFcn", "selectionuniform", "ConstraintTolerance", 1e-06, "Display", "off", "PlotFcn", "gaplotbestf");
    
    [X_opt, fval_opt, exitflag, output, population, scores] = ga(fun, nvars, A, b, Aeq, beq, lb, ub, nonlcon, intcon, options);
    
    figure(2);
    plot(X_opt(:,1), X_opt(:,2), 'ro');
    hold on
    
    X_optArray = [X_optArray; X_opt];
    fval_optArray = [fval_optArray; fval_opt];

% end

[fval_opt, I] = min(fval_optArray);
X_opt = X_optArray(I, :);
plot(X_opt(:,1), X_opt(:,2), 'kx', 'LineWidth', 1);

% =====================================
fprintf('Iter: %2.0f\n', i)
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('exitflag: %6.4f\n',exitflag)
fprintf('X(1) Value of Optimum Point: %6.4f\n',X_opt(:,1))
fprintf('X(2) Value of Optimum Point: %6.4f\n',X_opt(:,2))
fprintf('Function Value of Optimum Point: %6.4f\n',fval_opt)

results = table(i, numFunc, toc, exitflag, X_opt(:,1), X_opt(:,2), fval_opt);
p = gca;

% % HW4_1
% exportgraphics(p, 'HW4_1.png','Resolution',300)
% writetable(results, 'Main_RastriginFunction_GA.xlsx', 'Sheet', 1);

% HW4_2
% exportgraphics(p, 'HW4_2.png','Resolution',300)
% writetable(results, 'Main_RastriginFunction_GA.xlsx', 'Sheet', 2);



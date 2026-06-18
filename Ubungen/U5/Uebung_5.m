%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc
clear all
close all

%% 1. Mathematical objective function 

function values = zielfunktion_1(x)
    values = -x.^2 - 5*x + 4;
end

function values = zielfunktion_2(x)
    values = sin(2*x) .* exp(-0.2 .* ((x - 5) .^ 2));
end

%% 2. Anonymous functions calling the objective functions 

zielfunktion_anonym_1 = @zielfunktion_1;
zielfunktion_anonym_2 = @zielfunktion_2;

%% 3. Graph the functions

% Vector with linearly sampled values of x
liste = -10:1e-2:10;

% Figure to plot the function 1
fig1 = figure;
plot(liste, zielfunktion_anonym_1(liste));
grid on;
hold on;
title('Gradient method for f_1(x)');

% Figure to plot the function 2
fig2 = figure;
plot(liste, zielfunktion_anonym_2(liste));
grid on;
hold on;
title('Gradient method for f_2(x)');

%% 4. Create the function for obtaining the gradient

function [x_opt] = gradientenverfahren(zielfunktion_anonym, ...
    x_start, epsilon, stepwidth, delta)

    x_opt = x_start;
    max_iter = 10000;
    iter = 0;

    while true

        % Calculate the derivate from the function by definition
        df = (zielfunktion_anonym(x_opt + epsilon) - ...
              zielfunktion_anonym(x_opt - epsilon)) ./ (2 * epsilon);

        % If derivates are approx 0, the algorithm stops
        if max(abs(df)) <= delta
            break;
        end

        % Values of x are increased by factor
        x_opt = x_opt + stepwidth .* df;

        iter = iter + 1;

        % Prevents the program from crashing due to infinite loops
        if iter >= max_iter
            warning('Maximum number of iterations reached.');
            break;
        end
    end
end

%% 5.Calculate and plot local maxima using the gradient method

% Init vars
epsilon = 1e-3;
delta = 1e-8;
stepwidth = 0.2;

% Random values for x_start
x_f1 = -10 + 20 * rand(1);
x_f2 = -10 + 20 * rand(3, 1);

% Call gradient method for both functions
gradient = @(zielfunktion_anonym, x_start) ...
    gradientenverfahren(zielfunktion_anonym, x_start, ...
    epsilon, ...
    stepwidth, ...
    delta);

x_opt_1 = gradient(zielfunktion_anonym_1, x_f1);
x_opt_2 = gradient(zielfunktion_anonym_2, x_f2);

% Add coordinates to both plots
figure(fig1);
hold on
stem(x_f1, zielfunktion_anonym_1(x_f1), 'filled');
stem(x_opt_1, zielfunktion_anonym_1(x_opt_1), 'filled');
legend('f_1(x)', 'x_{start}', 'Local maxima', Location='southwest');
hold off;

figure(fig2);
hold on
stem(x_f2, zielfunktion_anonym_2(x_f2), 'filled');
stem(x_opt_2, zielfunktion_anonym_2(x_opt_2), 'filled');
legend('f_2(x)', 'x_{start}', 'Local maxima', Location='southwest');
hold off;


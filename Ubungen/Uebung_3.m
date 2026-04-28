%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)
% Andres Esteban Murillo Moreno (108025118109)
% Santiago Andres Acosta Parra (108025118010)

clc       % clear the command window
clear all % clear all variables in the workspace
close all % close all open figure windows


unsortierteliste = randi([0 1000 ], 1, 240);        % Test list

% unsortierteliste = load("unsortierteliste.dmg")


animate = false; % Animation can be seen by changing 'animate' to true
sortierteliste = bubblesort(unsortierteliste, animate);
disp(sortierteliste)
plot_result(sortierteliste, unsortierteliste);

function sortierteliste = bubblesort(unsortierteliste, animate)
    % Length of the unsorted array and creation of the result array
    n = length(unsortierteliste);
    sortierteliste = int32.empty(n, 0);

    % In each iteration the last index that we check decreases, as it is
    % known that the last number that we sorted was indeed the biggest
    % number among all the remaining list
    for end_index = n-1:-1:1
        for i = 1:end_index
            update_graph(animate, sortierteliste, unsortierteliste, i, n, true, true);
            if (unsortierteliste(i) > unsortierteliste(i+1)) % Compare the current number with the next one
                % Swap if current is bigger that next one
                temp = unsortierteliste(i);
                unsortierteliste(i) = unsortierteliste(i+1);
                unsortierteliste(i+1) = temp;
            end
        end
        % Update sorted list with the biggest number from the remaining
        % unsorted list
        sortierteliste(end_index+1) = unsortierteliste(end_index+1);
        unsortierteliste(1:n);
        update_graph(animate, sortierteliste, unsortierteliste, i, n, false, false);
    end
    % Last iteration is not needed
    sortierteliste(1) = unsortierteliste(1);
    update_graph(animate, sortierteliste, unsortierteliste, i, n, false, false);
end

function plot_result(sortierteliste, unsortierteliste)
    figure;
    subplot(2,1,1)
    bar(unsortierteliste, 'red')
    title('Unsortierteliste')
    subplot(2,1,2)
    bar(sortierteliste, 'green')
    title('Sortierteliste')
end


function update_graph (animate, sortierteliste, unsortierteliste, i, n, disp_current, disp_next)
    if(animate)
        bar(unsortierteliste, 'red');
        hold on
        bar(sortierteliste, 'green');
        if disp_current
            current = zeros([n,1]);
            current(i) = unsortierteliste(i);
            bar(current, 'blue');
        end
        if disp_next
            next = zeros([n,1]);
            next(i+1) = unsortierteliste(i+1);
            bar(next, 'yellow');
        end
        hold off
        pause(0.0001)
    end
end
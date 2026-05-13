%%
% Juan Jose Garcia Leon (108025118945)
% Jorge Enrique Rojas Perez (108025118076)

clc       % clear the command window
clear all % clear all variables in the workspace
close all % close all open figure windows


unsortierteliste = randi([0 1000 ], 1, 240);        % Test list

load("unsortierteliste.mat", "unsortierte_liste");


animate = false; % Animation can be seen by changing 'animate' to true
sortierte_liste = bubblesort(unsortierte_liste, animate);
sortierte_liste = bubblesort_fast(unsortierteliste); 
plot_result(sortierte_liste, unsortierte_liste);

function sortierteliste = bubblesort(unsortierteliste, animate)
    % Length of the unsorted array and creation of the result array
    n = length(unsortierteliste);
    sortierteliste = zeros(size(unsortierteliste));

    if animate
        % Create figure and bars once
        figure;
        h_unsorted = bar(unsortierteliste, 'red');
        hold on

        h_sorted = bar(sortierteliste, 'green');

        current = zeros(size(unsortierteliste));
        next = zeros(size(unsortierteliste));

        h_current = bar(current, 'blue');
        h_next = bar(next, 'yellow');

        hold off
        title('Bubble Sort Animation')
    end

    counter = 0;
    update_every = 5;

    % In each iteration the last index that we check decreases, as it is
    % known that the last number that we sorted was indeed the biggest
    % number among all the remaining list
    for end_index = n-1:-1:1

        swapped = false;

        for i = 1:end_index
            % Compare the current number with the next one
            if (unsortierteliste(i) > unsortierteliste(i+1)) 
                % Swap if current is bigger that next one
                temp = unsortierteliste(i);
                unsortierteliste(i) = unsortierteliste(i+1);
                unsortierteliste(i+1) = temp;

                swapped = true;
            end

            counter = counter + 1;

            if animate && mod(counter, update_every) == 0
                update_graph(h_unsorted, h_sorted, h_current, h_next, ...
                    sortierteliste, unsortierteliste, i);
            end
        end

        % Update sorted list with the biggest number from the remaining
        % unsorted list
        sortierteliste(end_index+1) = unsortierteliste(end_index+1);

        if animate
            update_graph(h_unsorted, h_sorted, h_current, h_next, ...
                sortierteliste, unsortierteliste, i);
        end

        % If there were no swap then the list was already sorted
        if ~swapped
            sortierteliste(1:end_index) = unsortierteliste(1:end_index);
            break;
        end
    end

    sortierteliste(1) = unsortierteliste(1);

    if animate
        update_graph(h_unsorted, h_sorted, h_current, h_next, ...
            sortierteliste, unsortierteliste, 1);
    end
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

function update_graph(h_unsorted, h_sorted, h_current, h_next, ...
                      sortierteliste, unsortierteliste, i)

    n = length(unsortierteliste);

    current = zeros(size(unsortierteliste));
    next = zeros(size(unsortierteliste));

    current(i) = unsortierteliste(i);

    if i < n
        next(i+1) = unsortierteliste(i+1);
    end

    h_unsorted.YData = unsortierteliste;
    h_sorted.YData = sortierteliste;
    h_current.YData = current;
    h_next.YData = next;

    drawnow limitrate
end
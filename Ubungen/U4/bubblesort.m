function sortierteliste = bubblesort(unsortierteliste)
    % Length of the unsorted array and creation of the result array
    n = length(unsortierteliste);
    sortierteliste = zeros(size(unsortierteliste));

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
        end

        % Update sorted list with the biggest number from the remaining
        % unsorted list
        sortierteliste(end_index+1) = unsortierteliste(end_index+1);

        % If there were no swap then the list was already sorted
        if ~swapped
            sortierteliste(1:end_index) = unsortierteliste(1:end_index);
            break;
        end
    end
    sortierteliste(1) = unsortierteliste(1);
end

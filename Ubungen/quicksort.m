function sortierteliste = quicksort(unsortierteliste)

    % in the quicksort function, the length of the input array is first checked 
    % to determine whether the recursion should stop
    if length(unsortierteliste) <= 1
        sortierteliste = unsortierteliste;
        return
    end

    % the last element of the array is selected as the pivot 
    pivot = unsortierteliste(end);
    less_than = unsortierteliste(unsortierteliste(1:end-1) < pivot);
    more_than = unsortierteliste(unsortierteliste(1:end-1) >= pivot);

    % the quicksort function is then called recursively on both sublists
    sortierteliste = [quicksort(less_than), pivot, quicksort(more_than)];
end
function sortierteListe = quicksort(unsortierteListe)

% in the quicksort function, the length of the input array is first checked 
% to determine whether the recursion should stop
if length(unsortierteListe) <= 1
    sortierteListe = unsortierteListe;
    return;
end

% the last element of the array is selected as the pivot 
pivot = unsortierteListe(end);


smaller = [];
greater = [];

% a for loop is used to iterate through all elements except the pivot
for i = 1:length(unsortierteListe)-1
    if unsortierteListe(i) < pivot
        smaller = [smaller, unsortierteListe(i)];
    else
        greater = [greater, unsortierteListe(i)];
    end
end

% the quicksort function is then called recursively on both sublists 
sorted_smaller = quicksort(smaller);
sorted_greater = quicksort(greater);

% the sorted sublists are combined together with the pivot 
sortierteListe = [sorted_smaller, pivot, sorted_greater];

end
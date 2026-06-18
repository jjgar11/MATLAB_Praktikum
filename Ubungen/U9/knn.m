function knn(K)

% KNN  K-Nearest Neighbor classifier

% % Load dataset
load('train.mat', 'trainData', 'trainLabel');
load('test.mat',  'testData',  'testLabel');

% % Find indices for output clases
xDefekt_idx = find(trainLabel == 0);
xIntakt_idx = find(trainLabel == 1);

% % Pre-create prediction vector
nTest  = size(testData, 1);
testLabelPredict = zeros(nTest, 1);

% % Separate training features
trainDim1 = trainData(:, 1);
trainDim2 = trainData(:, 2);

% % Loop over testData dataset
for j = 1:nTest

    % Compute distance to all training points
    dist = sqrt( (trainDim1 - testData(j, 1)) .^2 + ...
        (trainDim2 - testData(j, 2)) .^2 );

    % Sort distances and determine the class to which the majority of 
    % the K closest vectors belong
    [~, ind] = sort(dist);
    testLabelPredict(j) = round(mean(trainLabel(ind(1:K))));
end

% % Evaluate classification
[accuracy, false_idx] = evaluate_classification(testLabel, testLabelPredict);

% % Print info
fprintf('Accuracy: %.2f%%\n', accuracy);
fprintf('Misclassified indices: ');
disp(false_idx');

% % Find indices of the predicted output clases for testData 
xDefekt_Predict_idx = find(testLabelPredict == 0);
xIntakt_Predict_idx = find(testLabelPredict == 1);

figure;
hold on; grid on;

% % Plot training data
scatter(trainData(xDefekt_idx, 1), trainData(xDefekt_idx, 2), 'filled', ...
    'MarkerFaceColor', 'blue');
scatter(trainData(xIntakt_idx, 1), trainData(xIntakt_idx, 2), 'filled', ...
    'MarkerFaceColor', 'green');

% % Plot classified test data
scatter(testData(xDefekt_Predict_idx, 1), testData(xDefekt_Predict_idx, 2), ...
    'x', 'MarkerEdgeColor', 'blue', 'LineWidth', 1.5);
scatter(testData(xIntakt_Predict_idx, 1), testData(xIntakt_Predict_idx, 2), ...
    'x', 'MarkerEdgeColor', 'green', 'LineWidth', 1.5);

% % Highlight all incorrectly classified machines
if ~isempty(false_idx)
    scatter(testData(false_idx, 1), testData(false_idx, 2), 80, 'o', ...
        'MarkerEdgeColor', 'red', 'LineWidth', 2);
end

xlabel('Temperatur');
ylabel('Lautstaerke');

legend('Defekt', 'Intakt', 'Defekt klassifiziert', 'Intakt klassifiziert', ...
    'Falsch klassifiziert', 'Location', 'northwest')
title(sprintf('K = %d  Accuracy = %.2f%%', K, accuracy));

hold off;

end
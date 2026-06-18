% Generates synthetic train.mat and test.mat matching the exercise structure.
% Defective (label=0): low temperature (~20), low loudness (~25)
% Intact    (label=1): high temperature (~42), high loudness (~43)
% Distribution matches Figure 3 from the exercise sheet (K=5, ~97.5% accuracy).

rng(42);

N_train_def = 100;
N_train_int = 100;
N_test_def  = 40;
N_test_int  = 40;

% --- Training data ---
defect_train = [normrnd(20, 5, N_train_def, 1), normrnd(25, 5, N_train_def, 1)];
intact_train = [normrnd(42, 7, N_train_int, 1), normrnd(43, 6, N_train_int, 1)];

trainData  = [defect_train; intact_train];
trainLabel = [zeros(N_train_def, 1); ones(N_train_int, 1)];

% Shuffle rows
idx = randperm(size(trainData, 1));
trainData  = trainData(idx, :);
trainLabel = trainLabel(idx);

% --- Test data ---
defect_test = [normrnd(20, 5, N_test_def, 1), normrnd(25, 5, N_test_def, 1)];
intact_test = [normrnd(42, 7, N_test_int, 1), normrnd(43, 6, N_test_int, 1)];

testData  = [defect_test; intact_test];
testLabel = [zeros(N_test_def, 1); ones(N_test_int, 1)];

idx = randperm(size(testData, 1));
testData  = testData(idx, :);
testLabel = testLabel(idx);

% --- Save ---
save('synthetic_train.mat', 'trainData', 'trainLabel');
save('synthetic_test.mat',  'testData',  'testLabel');

fprintf('synthetic_train.mat: %dx%d features, %d labels\n', size(trainData,1), size(trainData,2), length(trainLabel));
fprintf('synthetic_test.mat:  %dx%d features, %d labels\n', size(testData,1),  size(testData,2),  length(testLabel));

clear all

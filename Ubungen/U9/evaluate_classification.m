function [accuracy, false_idx] = evaluate_classification(testLabel, testLabelPredict)
% evaluate_classification - Computes the accuracy by comparing the
% predicted labels with the ground truth labels
%
% Syntax:  [accuracy, false_idx] = evaluate_classification(testLabel, testLabelPredict)
%
% Inputs:
%   testLabel - ground truth labels
%   testLabelPredict - predicted labels (same order and length as testLabels required)
%
% Outputs:
%   accuracy - classification accuracy in % 
%   false_idx - indices of all false classified entries
%
% Corresponds to: Matlab-Praktikum A
%
% Author: Lea Schoenherr
% email: lea.schoenherr@rub.de
% Last revision: 18-December-2018
%
%------------- BEGIN CODE --------------

if length(testLabel) ~= length(testLabelPredict) 
    error('testLabel and testLabelPredict requires same length')
end

% find all false classified entries
false_idx = find(categorical(testLabelPredict) ~= categorical(testLabel));

% caclulate classification accuracy
accuracy = 100 * (1 - length(false_idx)/length(testLabel)); 

end


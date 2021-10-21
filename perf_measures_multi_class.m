function [average_sensitivity, average_precision, average_specificity]= perf_measures_multi_class(target, output)

% This function is to compute the performance scores for multi-class classification

% The confusion matrix should be:
%                        Predicted
%                      A   B   C  .... 
% Target    A          aa  ab  ac ....
%           B          ba  bb  bc ....
%           C          ca  cb  cc ....
%           .           .   .   . ....
%           .           .   .   . ....

% Created by Mahinda Mailagaha Kumbure
% Reference:  Kumbure, M.M., Luukka,P.& Collan M.(2020) A new fuzzy k-nearest neighbor 
%             classifier based on the Bonferroni mean. Pattern Recognition Letters, 140, 172-178.


[C_matrix,~] = confusionmat(target, output);

numOfClasses = size(C_matrix,1);
[TP,TN,FP,FN,accuracy,sensitivity,specificity,precision,f_score] = deal(zeros(numOfClasses,1));

for class = 1:numOfClasses
   TP(class) = C_matrix(class,class);
   tempMat = C_matrix;
   tempMat(:,class) = []; % remove column
   tempMat(class,:) = []; % remove row
   TN(class) = sum(sum(tempMat));
   FP(class) = sum(C_matrix(:,class))-TP(class);
   FN(class) = sum(C_matrix(class,:))-TP(class);
end
for class = 1:numOfClasses
    accuracy(class) = (TP(class) + TN(class)) / (TP(class) + TN(class)+ FP(class)+ FN(class));
    sensitivity(class) = TP(class) / (TP(class) + FN(class));
    specificity(class) = TN(class) / (FP(class) + TN(class));
    precision(class) = TP(class) / (TP(class) + FP(class));
    f_score(class) = 2*TP(class)/(2*TP(class) + FP(class) + FN(class));
end

average_sensitivity = mean(sensitivity);
average_specificity = mean(specificity);
average_precision   = mean(precision);





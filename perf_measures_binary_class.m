function [sensitivity, precision, specificity]= perf_measures_binary_class(target, output)

% This function is to compute the performance scores for binary classification
% problems (Positive:=1 and Negative:=2)

% The confusion matrix should be:
%                        Predicted
%                   positive   Negative
% Target    True       TP          FN
%           False      FP          TN

% [C_matrix,G_order] = confusionmat(target, output);
% 
%    TP = C_matrix(1,1);
%    TN = C_matrix(2,2);
%    FP = C_matrix(2,1);
%    FN = C_matrix(1,2);

% Created by Mahinda Mailagaha Kumbure
% Reference:  Kumbure, M.M., Luukka,P.& Collan M.(2020) A new fuzzy k-nearest neighbor 
%             classifier based on the Bonferroni mean. Pattern Recognition Letters, 140, 172-178.


n=length(target);
TP=0;
FP=0;
TN=0;
FN=0;
for i=1:n
    if (output(i)==1 && target(i)==1)       %healthy correctly identified as healthy
        TP=TP+1;
    elseif (output(i)==2 && target(i)==2)   %Sick correctly identified as sick
        TN=TN+1;
    elseif (output(i)==1 && target(i)==2)   %healthy incorrectly identified as sick
        FN=FN+1;
    elseif (output(i)==2 && target(i)==1)   %sick incorrectly identified as healthy
        FP=FP+1;
    end
end

sensitivity = TP / (TP + FN);
specificity = TN / (FP + TN);
precision = TP / (TP + FP);




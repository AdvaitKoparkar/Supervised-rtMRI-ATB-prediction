%% Choose Least Score Lambda
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function best_lambda(sub)
% sub = {'F1', 'F2', 'M1', 'M2'};
lambda = [0, 0.001, 0.002, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.5, 1, 5, 10];

for s = 1:size(sub, 2)
    for fold = 1:5
        min_mean_score = inf;
        best_lambda_index = 0;
        for l = lambda
            load(['./' sub{s} '/Fold' num2str(fold) '/Dev_score_DP_lambda' num2str(l) '.mat']);
            if mean(score) < min_mean_score
                min_mean_score = mean(score);
                best_lambda_index = find(lambda == l);
            end
        end
        
        save(['./' sub{s} '/Fold' num2str(fold) '/Best_lambda_index.mat'], 'best_lambda_index');
    end
end
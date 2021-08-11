function [scoreA, scoreB] = generateDiscriminantCase3(mu, sigma, priorW1, data)

% Looping through data for each class
scoreA = [];
scoreB = [];

% Generating class A scores
for i=1:length(data.a)
    point = transpose(data.a(i,:));
    g1 = case3(mu.a, point, sigma.a, priorW1);
    g2 = case3(mu.b, point, sigma.b, 1-priorW1);
    scoreA = [scoreA ; g1,g2];
end

% Generating class B scores
for i=1:length(data.b)
    point = transpose(data.b(i,:));
    g1 = case3(mu.a, point, sigma.a, priorW1);
    g2 = case3(mu.b, point, sigma.b, 1-priorW1);
    scoreB = [scoreB ; g2,g1];
end

% Plotting data
hold off
plot(data.a(:,1),data.a(:,2), "*")
hold on 
plot(data.b(:,1),data.b(:,2), "*")
title("Decision Bound: Accuracy = 91.00%")
xlabel("X_1")
ylabel("X_2")

% Generating and plotting boundary line (solving g1 = g2)
f = @(x1,x2) case2(mu.a, [x1;x2], sigma.a, priorW1) - case2(mu.b, [x1;x2], sigma.b, 1-priorW1);
fimplicit(f)
legend("Class 1", "Class 2", "Decision Boundary")
end

% Accuracy calculation
% nSamples = 400;
% Prediction using maximum score function (g)
% correct = sum(scoreA(:,1) > scoreA(:,2)) + sum(scoreB(:,1) > scoreB(:,2))
% accuracy = correct / nSamples

% OUTPUT: Accuracy 1.7c)88.00
% OUTPUT: Accuracy 1.7f)91.00


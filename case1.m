function [g] = case1(mu, point, prior)

% General rule for discriminant function on Bayes (Gaussian) classifier
% gi(x) = ln(p(x|ωi))+lnP(ωi)
% for each x, choose class ωk if k = argmax gi(x)

% Simplified formula for CASE 1
g = transpose(mu) * point - (1/2)*transpose(mu) * mu + log(prior);
end


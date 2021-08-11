function [g] = case1(mu, point, sigma, prior)

% General rule for discriminant function on Bayes (Gaussian) classifier
% gi(x) = ln(p(x|ωi))+lnP(ωi)
% for each x, choose class ωk if k = argmax gi(x)

% Simplified formula for CASE 2
g = -(1/2)*transpose(point - mu)*(sigma^-1)*(point - mu) + log(prior);
end

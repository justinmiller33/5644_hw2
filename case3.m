function [g] = case1(mu, point, sigma, prior)

% General rule for discriminant function on Bayes (Gaussian) classifier
% gi(x) = ln(p(x|ωi))+lnP(ωi)
% for each x, choose class ωk if k = argmax gi(x)

% Simplified formula for CASE 3
g = transpose(point)*-(1/2)*(sigma^-1)*point + transpose((sigma^-1)*mu)*point + -(1/2)*transpose(mu)*(sigma^-1)*mu -(1/2)*log(norm(sigma)) + log(prior); 
end

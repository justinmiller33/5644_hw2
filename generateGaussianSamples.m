function [data] = generateGaussianSamples(mu, nSamples, sigma, priorW1)

% Seeding 
rng(456);

% Using the prior to decide the count of a & b samples
aSamples = 0;
bSamples = 0;
for n=1:nSamples    
    if rand < priorW1
        aSamples = aSamples+1;
    else
        bSamples = bSamples+1;   
    end
end

% Use mu & sigma structs to generate data for both classes
data = struct;
data.a = mvnrnd(mu.a,sigma.a,aSamples);
data.b = mvnrnd(mu.b,sigma.b,bSamples);

% Plotting
hold off
plot(data.a(:,1),data.a(:,2), "*")
hold on 
plot(data.b(:,1),data.b(:,2), "*")
legend("Class 1", "Class 2")
title("2D Gaussian Distribution")
xlabel("X_1")
ylabel("X_2")

end

% Calls:
% a) data = generateGaussianSamples(struct("a",[0; 0], "b", [3;3]), 400, struct("a", eye(2), "b", eye(2)), 0.5)
% b) data = generateGaussianSamples(struct("a",[0; 0], "b", [3;3]), 400, struct("a", [3,1;1,0.8], "b", [3,1;1,0.8]), 0.5)
% c) data = generateGaussianSamples(struct("a",[0; 0], "b", [2;2]), 400, struct("a", [2,0.5;0.5,1], "b", [2,-1.9;-1.9,5]), 0.5)
% d) data = generateGaussianSamples(struct("a",[0; 0], "b", [3;3]), 400, struct("a", eye(2), "b", eye(2)), 0.05)
% e) data = generateGaussianSamples(struct("a",[0; 0], "b", [3;3]), 400, struct("a", [3,1;1,0.8], "b", [3,1;1,0.8]), 0.05)
% f) data = generateGaussianSamples(struct("a",[0; 0], "b", [2;2]), 400, struct("a", [2,0.5;0.5,1], "b", [2,-1.9;-1.9,5]), 0.05)

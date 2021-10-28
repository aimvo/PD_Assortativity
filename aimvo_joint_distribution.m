function jpdf = aimvo_joint_distribution(lambda,rho,N)
%
%   aimvo_joint_distribution.m         Visualize assortativity effect
%
%   Plot 2D display of a joint probability distribution of remaining degree (i.e., the total 
%   degree centrality for each node, minus the connected edge) for random pairs of 
%   nodes in a network space using the bivariate Gaussian copula with the correlation matrix S=[1  rho; rho  1]. 
%   Poisson marginal distributions (N random numbers, mean=λ) were computed for each variable, 
%   where rho is the degree-degree correlation coefficient (assortativity) and λ is the average degree of the network. 
%   These two parameters are estimated from the empiric data from each group/subject and network. 
%   The simulation steps are performed using Statistics and Machine Learning Toolbox, MATLAB.
%
%   Inputs:     lambda, average degree of a network
%               rho,    degree correlation/assortativity coefficient of a network or a subnetwork 
%               N,      number of random numbers                        
% 
%   Outputs:    jpdf, joint probability distribution
%
%   Reference:  An Vo, Katharina Schindlbeck, Nha Nguyen et al. Adaptive and 
%               pathological connectivity responses in Parkinson’s disease 
%               brain networks, 12 October 2021, PREPRINT (Version 1) available 
%               at Research Square [https://doi.org/10.21203/rs.3.rs-927446/v1]
%
%   An Vo, The Feinstein Institutes for Medical Research, Manhasset, NY, 2021
%   Nha Nguyen, Albert Einstein College of Medicine, Bronx, NY, 2021
%
%   Version 01 was updated on October 28, 2021
%--------------------------------------------------------------------------

n = N*N;
xmin = -lambda+lambda;
xmax = lambda+lambda;
pts = (xmin:1:xmax);
X = zeros(n,2);
Z = mvnrnd([0 0],[1 rho; rho 1],n); 
U = normcdf(Z);
X(1:n,1:2) = [poissinv(U(:,1),lambda) poissinv(U(:,2),lambda)];  
degi = X(1:n,1,:);
degj = X(1:n,2,:);
[~,xi] = ksdensity(degi,pts);
[~,yi] = ksdensity(degj,pts);
hh = hist3(X,{xi yi});
p = hh/n;
c_axis = [0 max(p(:))];
imagesc(xi,yi,p);
axis square
caxis(c_axis)
c = colorbar;
c.Limits = c_axis;
pax = gca;
pax.YDir = 'normal';
pax.FontSize = 12;
%pax.FontWeight = 'bold';
pax.LineWidth = 1;
pax.Color ='white';
pax.Box ='off';
xlabel('di'); ylabel('dj');
set(gcf,'renderer','opengl');
jpdf = p;  
end

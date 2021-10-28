%   Demo aimvo_joint_distribution.m
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
% clear all
% clc
% close all

%   PD-Late: lambda = 13; rho = 0.34; 
%   These two parameters were estimated from the empiric data from PD-Late group in PDRP network space. 
lambda = 13;
rho = 0.34;
N = 1000;
tic
jpdf = aimvo_joint_distribution(lambda,rho,N);
toc

% save figure
% file_name can be defined by users
% file_name = 'demo_aimvo_joint_distribution.png';
% saveas(gcf,file_name)
% or save Figure in .png format with resolution of 600 dpi
% print(file_name,'-dpng','-r600')



%   Demo aimvo_graph_plot.m   
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
%
% clear all
% clc
% close all
%
%   Brain Connectivity Toolbox
%   https://sites.google.com/site/bctnet/
%   path1 = '/home/annguyen/Documents/Software/BCT/2017_01_15_BCT/';
%   addpath(path1);

NodeName = importdata('Node_ID_PDRP_PDCP.xlsx');
nodeID = NodeName.data.PDCP_blue;
%-------------------------------------------------------------------------
%   NodeLabel = nodeID; or 
%   NodeLabel = NodeName.textdata.PDCP_blue; or
    NodeLabel = {'PreC L'  'SFr L'  'SFr R'  'MFr L'  'IFrOp L'  'IFrTr L' 'SMA L' 'SMA R' 'SFrM L' 'SFrM R' 'SPar L' 'IPar L' 'SMarg L' 'Ang L' 'PCun L' 'PCun R' };

load('demo_AdM.mat')
V = AdM(nodeID,nodeID); 
thr = 0.3; 
WU=abs(threshold_absolute(V,thr));  
BU=WU; BU(BU>0)=1;
tic
aimvo_graph_plot(BU,NodeLabel)
toc

% save figure; file_name can be defined by users
% file_name = 'demo_aimvo_graph_plot.png';
% saveas(gcf,file_name)
% or save Figure in .png format with resolution of 600 dpi
% print(file_name,'-dpng','-r600')



function aimvo_graph_plot(V,NodeLabel)
%
%   aimvo_graph_plot.m         Plot undirected graph
%
%   Inputs:     V, adjacency matrix of a graph
%               NodeLabel,a vector of node names
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

L =size(V,1);
node_color = [191 191 191]/256;         %   gray 
high_color = [255 255 0]/256;           %   yellow
low_color =  [0 176 240]/256;           %   blue
edge_color = [166 166 166]/256;         %   gray
linew = 1.0;      
quartile_value = [0.25 0.50 0.75];
font_size = 12;
deg = degrees_und(V);
G = graph(V,'OmitSelfLoops');
figure(1); plot(G)
p = plot(G);
p.NodeColor = node_color;
quartile_degree = quantile(deg,quartile_value);
high_nodes = find(deg>=quartile_degree(3))';
low_nodes = find(deg<=quartile_degree(1))';
%   med_nodes = setdiff([1:L],[high_nodes; low_nodes]);
highlight(p,high_nodes,'NodeColor',high_color)
highlight(p,low_nodes,'NodeColor',low_color)
p.MarkerSize = 2 + deg.^2/(L+2);
if max(p.MarkerSize(:))> 50
   p.MarkerSize =10;
end
p.LineWidth = linew ;
p.NodeFontSize = font_size;
p.EdgeColor =  edge_color;
p.NodeLabel= NodeLabel;
pax = gca;
pax.FontSize = 12;
pax.FontWeight = 'bold';
pax.Color ='white';
pax.Box ='off';
axis off
fig = gcf;
fig.Color ='white';







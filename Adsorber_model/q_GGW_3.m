function [q_GGW_3] = q_GGW_3(P,y)

% The following Isotherm data was taken from:
% <<McDonald et-al, "Cooperative insertion of CO2 in diamineappended
% metal-organic frameworks", 2015.>>
% doi:10.1038/nature14327
% The data for the Mg compuond was used.

% A function was then adjusted to this data, using a symple trial-Error
% Approach in an Excel sheet. The best fitted function structure was the
% ArcTang. For the extended explanation see "Skizze.xlsx", sheet "GGW".

% P[=]kPa
P=P/1000;
% transformation: ppm -> molCO2/molTOT
y=y/1000000;

py = P*y;
%In case of negatives Values (results will not be taken in to account, but
%the simulation would not be allowed to spend time in useless calculations
if py <0 
     py=0;
end    

q_GGW_3 = 2.15*atan(((py*29)^(5.2)));
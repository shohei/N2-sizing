clear; close all; clc;

% Rocket details
z = 500; %m;
g = 9.8; %m/s2
deltaV = sqrt(2*g*z); %m/s
T_final= 15-6.5*z/1000; %deg C
a_final = 20.0468*sqrt(T_final+273.15); %m/s
M_final = deltaV/a_final;
Isp = 164; %s
Ve = g*Isp; % for optimal expansion
mf_mi = exp(-deltaV/Ve);
% TODO: 燃料重量の計算
% 燃料密度 x 体積
% 密度はわかるが体積は未知
% 体積を決める→スロート径はわかるが外径が未知
% 外径はペイロードから決まる？

% Motor calculations
% KNSU
rho = 1.8e3; %kg/m3








clear; close all; clc;

% Rocket details
z = 500; %m;
g = 9.8; %m/s2
deltaV = sqrt(2*g*z); %m/s
T_final= 15-6.5*z/1000; %deg C
a_final = 20.0468*sqrt(T_final+273.15); %m/s
M_final = deltaV/a_final;
% Isp
Isp_efficiency = 130/166; %KNSU delivered/theoretical
Isp_theoretical = 164; %Ideal: https://www.nakka-rocketry.net/techs2.html
Isp = Isp_theoretical * Isp_efficiency; % 128s
Ve = g*Isp; % for optimal expansion
lambda = exp(-deltaV/Ve); %構造重量比 m_final / m_initial

% Motor requirements
Pc = 2e6; %average chamber pressure [Pa]
F_ave = 300; %average thrust [N]
t_burn = 2; %burn duration [s]
Ta = 273.15+25; %Operating temperature [K]
Pe = 0.101315e6; %Pa

% TODO: 燃料重量の計算
% 燃料密度 x 体積
% 密度はわかるが体積は未知
% 体積を決める→スロート径はわかるが外径が未知
% 外径はペイロードから決まる？
% →Ispより質量流量mdotが求まるので、燃焼時間を仮定すると必要な燃料総重量が求まる
mdot = F_ave/(g*Isp); %kg/s
m_p = mdot * t_burn; %kg: 推進剤重量
mi = m_p/(1-lambda);%kg: 機体総重量
mf = mi*lambda;%kg: ドライ重量

% Motor calculations
% KNSB
% https://www.nakka-rocketry.net/bntest.html
% https://www.nakka-rocketry.net/techs2.html
rho = 1.841e3; %kg/m3
k = 1.1361;
M = 39.86; %kg/kmol
Rbar = 8314; %J/kmol•K
R = Rbar/M; % J/kg•K
T0 = 1600; %K
% burn rate coefficient a, burn rate exponent n
a = 7.852; % mm/sec (for 1.5-3.8MPa)
n = -0.013; % mm/sec (for 1.5-3.8MPa)

% Optimal expantion ratio
e_opt_inv = ((k+1)/2)^(1/(k-1))*(Pe/Pc)^(1/k)*sqrt((k+1)/(k-1)*(1-(Pe/Pc)^((k-1)/k)));
e_opt = 1/e_opt_inv;
% Thrust coefficient
Cf = sqrt((2*k^2)/(k-1)*(2/(k+1))^((k+1)/(k-1))*(1-(Pe/Pc)^((k-1)/k)));
% Throat Area
At = F_ave/(Pc*Cf); %m2
% Throat diameter
Dt = sqrt(4*At/pi)*1e3; %mm
% Burn rate
r =  a*Pc^n; %[mm/s]








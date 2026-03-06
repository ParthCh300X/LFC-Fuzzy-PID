%% =====================================================
% Model 3 — Fuzzy PID Parameters
% Two-Area Load Frequency Control
% =====================================================

clc; clear;

%% -------------------------------
% Power system parameters
%% -------------------------------
Tg  = 0.08;
Tt  = 0.30;
Kps = 120;
Tps = 20;

R = 2.4;
B = 0.425;

T12 = 0.0866;
TieGain = 2*pi*T12;

StepTime  = 1;
StepValue = 0.01;

%% -------------------------------
% ZN PID gains (Model 2 base)
%% -------------------------------

Pu = 62.93;

Ku1 = 0.25;
Kp1 = 0.6*Ku1;
Ti1 = 0.5*Pu;
Td1 = 0.125*Pu;

Ki1 = Kp1/Ti1;
Kd1 = Kp1*Td1;

Ku2 = 0.05;
Kp2 = 0.6*Ku2;
Ti2 = Ti1;
Td2 = Td1;

Ki2 = Kp2/Ti2;
Kd2 = Kp2*Td2;

%% -------------------------------
% Fuzzy normalization parameters
%% -------------------------------

ACE_norm  = 0.15;
dACE_norm = 0.05;

alpha = 0.0625;      % adaptation strength

disp('✅ Model 3 parameters loaded');
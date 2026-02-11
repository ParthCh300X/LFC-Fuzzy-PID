%% 
% =========================================================
% params_ZN_system.m
% Two-area LFC — Ziegler–Nichols tuned PID
% =========================================================


%% -------------------------------
% Physical system parameters
%% -------------------------------

Tg  = 0.08;      % Governor time constant (s)
Tt  = 0.30;      % Turbine time constant (s)
Kps = 120;       % Power system gain
Tps = 20;        % Power system time constant (s)

R = 2.4;         % Speed regulation
B = 0.425;       % Frequency bias constant

T12 = 0.0866;                % Tie-line synchronizing coefficient
TieGain = 2*pi*T12;          % Tie-line gain

StepTime  = 1;               % Load disturbance time (s)
StepValue = 0.01;            % 1% step load

%% -------------------------------
% Ziegler–Nichols tuning
%% -------------------------------

Pu = 62.93;                  % Ultimate period (measured)

% ----- Area 1 -----
Ku1 = 0.25;

Kp1 = 0.6 * Ku1;             % 0.15
Ti1 = 0.5 * Pu;              % 31.46
Td1 = 0.125 * Pu;            % 7.87

Ki1 = Kp1 / Ti1;             % 0.00477
Kd1 = Kp1 * Td1;             % 1.18

% ----- Area 2 -----
Ku2 = 0.05;

Kp2 = 0.6 * Ku2;             % 0.03
Ti2 = Ti1;                   % same Pu assumption
Td2 = Td1;

Ki2 = Kp2 / Ti2;             % 0.00095
Kd2 = Kp2 * Td2;             % 0.236

%% -------------------------------
% Fuzzy controller parameters
%% -------------------------------

ACE_norm  = 0.20;
dACE_norm = 0.1;
alpha= 0.002;

fis = readfis('fuzzy_pid');

disp('✅ Fuzzy parameters loaded');

disp('✅ ZN system + PID parameters loaded');
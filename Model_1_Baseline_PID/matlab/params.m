% ================================
% params.m — Baseline PID (Model 1)
% Two-area Load Frequency Control
% ================================

% -------- Power system parameters --------
Tg  = 0.08;      % Governor time constant (s)
Tt  = 0.30;      % Turbine time constant (s)
Kps = 120;       % Power system gain
Tps = 20;        % Power system time constant (s)

R = 2.4;         % Speed regulation (Hz/pu MW)
B = 0.425;       % Frequency bias constant

% -------- Tie-line parameters --------
T12 = 0.0866;              % Synchronizing coefficient
TieGain = 2*pi*T12;        % Tie-line gain (≈ 0.544)

% -------- Disturbance --------
StepTime  = 1;             % Load disturbance time (s)
StepValue = 0.01;          % 1% step load change (pu)

% -------- Baseline PID gains (manual tuning) --------
% Area 1
Kp1 = 0.30;
Ki1 = 0.10;
Kd1 = 0.00;

% Area 2
Kp2 = 0.30;
Ki2 = 0.10;
Kd2 = 0.00;

Kp_test = 0.05;

disp('✅ Baseline PID parameters loaded');
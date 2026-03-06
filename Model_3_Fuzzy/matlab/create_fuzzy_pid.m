%% =========================================================
% create_fuzzy_pid.m
% Fuzzy gain tuner for Two-Area LFC (Model 3)
% =========================================================

clc;

%% Create Mamdani FIS
fis = mamfis('Name','fuzzy_pid');

%% =========================================================
% INPUT 1 : ACE (Error)
% =========================================================
fis = addInput(fis,[-1 1],'Name','Error');

fis = addMF(fis,'Error','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'Error','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'Error','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'Error','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'Error','trimf',[0.5 1 1],'Name','PB');

%% =========================================================
% INPUT 2 : dACE (Derivative of Error)
% =========================================================
fis = addInput(fis,[-1 1],'Name','dError');

fis = addMF(fis,'dError','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'dError','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'dError','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'dError','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'dError','trimf',[0.5 1 1],'Name','PB');

%% =========================================================
% OUTPUT : ΔKp (Gain Adjustment)
% =========================================================
fis = addOutput(fis,[-1 1],'Name','dK');

fis = addMF(fis,'dK','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'dK','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'dK','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'dK','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'dK','trimf',[0.5 1 1],'Name','PB');

%% =========================================================
% 25-RULE BASE (Standard LFC fuzzy tuning)
% =========================================================
rules = [
1 1 1 1 1
1 2 1 1 1
1 3 2 1 1
1 4 2 1 1
1 5 3 1 1

2 1 1 1 1
2 2 2 1 1
2 3 2 1 1
2 4 3 1 1
2 5 4 1 1

3 1 2 1 1
3 2 2 1 1
3 3 3 1 1
3 4 4 1 1
3 5 4 1 1

4 1 2 1 1
4 2 3 1 1
4 3 4 1 1
4 4 4 1 1
4 5 5 1 1

5 1 3 1 1
5 2 4 1 1
5 3 4 1 1
5 4 5 1 1
5 5 5 1 1
];

fis = addRule(fis,rules);

%% =========================================================
% Save + send to workspace
% =========================================================

writeFIS(fis,'fuzzy_pid');      % creates fuzzy_pid.fis file
assignin('base','fuzzy_pid',fis); % makes it visible to Simulink

disp('✅ fuzzy_pid created and loaded into workspace');
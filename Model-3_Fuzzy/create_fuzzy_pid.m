%% =========================================================
% create_fuzzy_pid.m
% Creates Fuzzy PID gain tuning FIS for 2-area LFC
% =========================================================



fis = mamfis('Name','fuzzy_pid');

%% -------------------------------
% INPUT 1 : ACE (Error)
%% -------------------------------
fis = addInput(fis,[-1 1],'Name','Error');

fis = addMF(fis,'Error','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'Error','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'Error','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'Error','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'Error','trimf',[0.5 1 1],'Name','PB');

%% -------------------------------
% INPUT 2 : dACE
%% -------------------------------
fis = addInput(fis,[-1 1],'Name','dError');

fis = addMF(fis,'dError','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'dError','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'dError','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'dError','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'dError','trimf',[0.5 1 1],'Name','PB');

%% -------------------------------
% OUTPUT : Delta Kp
%% -------------------------------
fis = addOutput(fis,[-1 1],'Name','dK');

fis = addMF(fis,'dK','trimf',[-1 -1 -0.5],'Name','NB');
fis = addMF(fis,'dK','trimf',[-1 -0.5 0],'Name','NS');
fis = addMF(fis,'dK','trimf',[-0.5 0 0.5],'Name','ZE');
fis = addMF(fis,'dK','trimf',[0 0.5 1],'Name','PS');
fis = addMF(fis,'dK','trimf',[0.5 1 1],'Name','PB');

%% -------------------------------
% 25-rule base (standard LFC tuning)
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

writeFIS(fis,'fuzzy_pid');
assignin('base','fuzzy_pid',fis);

disp('✅ Fuzzy PID FIS created successfully');
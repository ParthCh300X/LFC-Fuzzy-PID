% ==========================================
% plot_results_Fuzzy.m
% Model 3 — Fuzzy PID Results
% ==========================================

clc;

%% Extract simulation outputs
t     = out.tout;
f1    = out.f1;
f2    = out.f2;
ptie  = out.ptie;

%% ======================================
% Frequency deviation (Both Areas)
% ======================================

figure;
set(gcf,'Color','k');   % black background
hold on;

plot(t, f1, 'r',  'LineWidth', 2.2);     % Area 1 — RED
plot(t, f2, 'c--','LineWidth', 2.2);     % Area 2 — CYAN dashed

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta f (Hz)','Color','w');
title('Fuzzy PID — Frequency Deviation','Color','w');

legend('\Delta f_1 (Area 1)', ...
       '\Delta f_2 (Area 2)', ...
       'TextColor','w','Location','best');

set(gca,'Color','k','XColor','w','YColor','w');

%% ======================================
% Area 1 only
% ======================================

figure;
set(gcf,'Color','k');

plot(t, f1, 'r', 'LineWidth', 2.2);

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta f_1 (Hz)','Color','w');
title('Area 1 Frequency — Fuzzy PID','Color','w');

set(gca,'Color','k','XColor','w','YColor','w');

%% ======================================
% Area 2 only
% ======================================

figure;
set(gcf,'Color','k');

plot(t, f2, 'c--', 'LineWidth', 2.2);

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta f_2 (Hz)','Color','w');
title('Area 2 Frequency — Fuzzy PID','Color','w');

set(gca,'Color','k','XColor','w','YColor','w');

%% ======================================
% Tie-line power deviation
% ======================================

figure;
set(gcf,'Color','k');

plot(t, ptie, 'b', 'LineWidth', 2.2);   % BLUE same as Model 1 & 2

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta P_{tie} (p.u.)','Color','w');
title('Tie-Line Power — Fuzzy PID','Color','w');

set(gca,'Color','k','XColor','w','YColor','w');

disp('✅ Fuzzy PID plots generated');
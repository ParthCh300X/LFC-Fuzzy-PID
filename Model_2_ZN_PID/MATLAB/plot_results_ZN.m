% ==========================================
% plot_results_ZN.m
% Model 2 — ZN Tuned PID
% ==========================================

t  = out.tout;
f1 = out.f1;
f2 = out.f2;
pt = out.ptie;

%% -------- Frequency deviation --------
figure;
set(gcf,'Color','k');   % black background
hold on;

plot(t, f1, 'r', 'LineWidth', 2.2);        % Area 1 — RED
plot(t, f2, 'c--', 'LineWidth', 2.2);      % Area 2 — CYAN dashed

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta f (Hz)','Color','w');
title('ZN-PID — Frequency Deviation','Color','w');
legend('\Delta f_1 (Area 1)','\Delta f_2 (Area 2)','TextColor','w');

set(gca,'Color','k','XColor','w','YColor','w');

%% -------- Tie-line power --------
figure;
set(gcf,'Color','k');   % black background
hold on;

plot(t, pt, 'b', 'LineWidth', 2.2);        % BLUE (same as baseline)

grid on;
xlabel('Time (s)','Color','w');
ylabel('\Delta P_{tie} (p.u.)','Color','w');
title('ZN-PID — Tie-Line Power Deviation','Color','w');

set(gca,'Color','k','XColor','w','YColor','w');
% ==========================================
% plot_results.m — Baseline PID (Model 1)
% ==========================================

% Extract simulation outputs
t  = out.tout;      % time vector
f1 = out.f1;        % frequency deviation Area 1
f2 = out.f2;        % frequency deviation Area 2
pt = out.ptie;      % tie-line power deviation

% -------- Frequency deviation plot --------
figure;
plot(t, f1, 'r', 'LineWidth', 1.8); hold on;
plot(t, f2, 'c--', 'LineWidth', 1.8);   % cyan dashed
xlabel('Time (s)');
ylabel('\Delta f (Hz)');
legend('\Delta f_1 (Area 1)', '\Delta f_2 (Area 2)', 'Location','Best');
title('Baseline PID — Frequency Deviation');
grid on;

% -------- Tie-line power plot --------
figure;
plot(t, pt, 'b', 'LineWidth', 1.8);
xlabel('Time (s)');
ylabel('\Delta P_{tie} (p.u.)');
title('Baseline PID — Tie-Line Power Deviation');
grid on;

disp('✅ Baseline PID plots generated');
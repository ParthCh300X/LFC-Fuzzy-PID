% ===============================
% Plot results - Model 3 (Fuzzy PID)
% ===============================

t = out.tout;

f1   = out.f1;
f2   = out.f2;
Ptie = out.ptie;

% ---------- Frequency Deviations ----------
figure
plot(t, f1, 'r', 'LineWidth', 1.8); hold on
plot(t, f2, 'c--', 'LineWidth', 1.8)
grid on
xlabel('Time (s)')
ylabel('\Delta f (Hz)')
title('Fuzzy PID — Frequency Deviation')
legend('\Delta f_1 (Area 1)', '\Delta f_2 (Area 2)', 'Location', 'best')

% ---------- Area 1 ----------
figure
plot(t, f1, 'r', 'LineWidth', 1.8)
grid on
xlabel('Time (s)')
ylabel('\Delta f_1 (Hz)')
title('Area 1 Frequency Deviation — Fuzzy PID')

% ---------- Area 2 ----------
figure
plot(t, f2, 'c--', 'LineWidth', 1.8)
grid on
xlabel('Time (s)')
ylabel('\Delta f_2 (Hz)')
title('Area 2 Frequency Deviation — Fuzzy PID')

% ---------- Tie-line ----------
figure
plot(t, Ptie, 'b', 'LineWidth', 1.8)
grid on
xlabel('Time (s)')
ylabel('\Delta P_{tie} (p.u.)')
title('Tie-Line Power Deviation — Fuzzy PID')
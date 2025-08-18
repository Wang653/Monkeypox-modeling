clc
close all
format long

% Parameters
betahh = 0.8333;
betarh = 0.8333;
paih = 0.3;
alphah = 1/8; 
gammah = 1/20; 
delta = 1/10;  %%%10
omega = 0.01;
A = 0.0;
B = 0.3;
% Animal 
paia = 0.3;
betarr = 0.5;
betahr = 0.5;
sigma = 0.0; 
alphar = 0.1;
gammar = 0.2;
x = 0.01; 
y = 0.1;
m = 0.1; 
eta = 0.9;
Ct = 0.1;
Cv = 0.1;

% time step
time_increment = 1;
tf = 201;

% MAS agent and k
k = 8;
agent = 100;

% Initial condition
Sh0 = 0.9999; 
Vh0 = 0.0; 
Eh0 = 0.0001;  
Ih0 = 0.0;
Th0 = 0.0;
Rh0 = 0.0;
Rs0 = 0.0;

Sr0 = 0.9999;
Er0 = 0.0001;
Ir0 = 0.0;

% Read Probability (MAS) table
Th = readtable("Power k=8.xlsx");
Ph = Th.Probability;

Tr = readtable("Power k=8.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

%Make a table
% Table = table(transpose(t), Vh_final, Ih_final, Th_final, Rh_final);
% FileName = append('SVEITR_BA_BA_k_',num2str(k),'_rho_',num2str(rho),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["t", "Vh", "Ih", "Th", "Rh"], 'A1:E1');

figure (1)
plot(t, Ih_final, 'r', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'r', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'r', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'r', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'r', 'linewidth', 2.5);
hold on
%%
k = 8;
% Read Probability (MAS) table
Th = readtable("Poisson k=8.xlsx");
Ph = Th.Probability;

Tr = readtable("Power k=8.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'k', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'k', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'k', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'k', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'k', 'linewidth', 2.5);
hold on
%%
k = 8;
% Read Probability (MAS) table
Th = readtable("Power k=8.xlsx");
Ph = Th.Probability;

Tr = readtable("Poisson k=8.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
 
figure (1)
plot(t, Ih_final, 'g', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'g', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'g', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'g', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'g', 'linewidth', 2.5);
hold on
%%
k = 8;
% Read Probability (MAS) table
Th = readtable("Poisson k=8.xlsx");
Ph = Th.Probability;

Tr = readtable("Poisson k=8.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'b', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'b', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'b', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'b', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'b', 'linewidth', 2.5);
hold on
%%
k = 16;
% Read Probability (MAS) table
Th = readtable("Power k=16.xlsx");
Ph = Th.Probability;

Tr = readtable("Power k=16.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'r:', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'r:', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'r:', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'r:', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'r:', 'linewidth', 2.5);
hold on
%%
k = 16;
% Read Probability (MAS) table
Th = readtable("Poisson k=16.xlsx");
Ph = Th.Probability;

Tr = readtable("Power k=16.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'k:', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'k:', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'k:', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'k:', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'k:', 'linewidth', 2.5);
hold on
%%
k = 16;
% Read Probability (MAS) table
Th = readtable("Power k=16.xlsx");
Ph = Th.Probability;

Tr = readtable("Poisson k=16.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'g:', 'linewidth', 2.5);
hold on
figure (2)
plot(t, Vh_final, 'g:', 'linewidth', 2.5);
hold on
figure (3)
plot(t, Th_final, 'g:', 'linewidth', 2.5);
hold on
figure (4)
plot(t, Rh_final, 'g:', 'linewidth', 2.5);
hold on
figure (5)
plot(t, Ir_final, 'g:', 'linewidth', 2.5);
hold on
%%
k = 16;
% Read Probability (MAS) table
Th = readtable("Poisson k=16.xlsx");
Ph = Th.Probability;

Tr = readtable("Poisson k=16.xlsx");  % Poisson, Power
Pr = Tr.Probability;

% Main function
[t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betarh, betahh, betarr, betahr, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, sigma, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);

figure (1)
plot(t, Ih_final, 'b:', 'linewidth', 2.5);
set(gca,'Fontsize',15,'LineWidth',2.0,'XColor','k','YColor','k') %increase the size of tickmarks
xlabel('Time (days)')
ylabel('I_h(t)')
ylim([0 0.04])
legend("BA(h)-BA(r)", "ER(h)-BA(r)", "BA(h)-ER(r)", "ER(h)-ER(r)","BA(h)-BA(r)", "ER(h)-BA(r)", "BA(h)-ER(r)", "ER(h)-ER(r)");
legend boxoff
hold off

figure (2)
plot(t, Vh_final, 'b:', 'linewidth', 2.5);
set(gca,'Fontsize',15,'LineWidth',2.0,'XColor','k','YColor','k') %increase the size of tickmarks
xlabel('Time (days)')
ylabel('V_h(t)')
ylim([0 0.6])
hold off
% legend("BA(H)-BA(R)", "ER(H)-BA(R)", "BA(H)-ER(R)", "ER(H)-ER(R)");
figure (3)
plot(t, Th_final, 'b:', 'linewidth', 2.5);
set(gca,'Fontsize',15,'LineWidth',2.0,'XColor','k','YColor','k') %increase the size of tickmarks
xlabel('Time (days)')
ylabel('T_h(t)')
ylim([0 0.25])
hold off
figure (4)
plot(t, Rh_final, 'b:', 'linewidth', 2.5);
set(gca,'Fontsize',15,'LineWidth',2.0,'XColor','k','YColor','k') %increase the size of tickmarks
xlabel('Time (days)')
ylabel('R_h(t)')
ylim([0 1.0])
hold off
% legend("BA(H)-BA(R)", "ER(H)-BA(R)", "BA(H)-ER(R)", "ER(H)-ER(R)");
figure (5)
plot(t, Ir_final, 'b:', 'linewidth', 2.5);
set(gca,'Fontsize',15,'LineWidth',2.0,'XColor','k','YColor','k') %increase the size of tickmarks
xlabel('Time (days)')
ylabel('I_r(t)')
ylim([0 0.25])
hold off
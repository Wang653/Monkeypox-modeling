clc
close all
format long

% Parameters
% betah = 0.8333;
paih = 0.5;
alphah = 1/8; 
gammah = 1/15; 
delta = 1/10; %%%10
omega = 0.05;
A = 0.0;
B = 0.3;

% Animal
% paia = 0.1;
betar = 0.5;
theta = 0.5; 
alphar = 0.1;
gammar = 0.2;
x = 0.05; 
y = 0.1;
m = 0.1; 
Ct = 0.5;
Cv = 0.5;
eta = 0.5;

% time step
time_increment = 1;
tf = 501;

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

% for HeatMap
PAIA = [];
BETAH = [];
VH = [];
RH = [];
RS = [];
ASP = [];

for paia = 0:0.05:1
    for betah = 0:0.05:1

    [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
    PAIA(end+1) = paia;
    BETAH(end+1) = betah;
    VH(end+1) = Vh_final(end);
    RH(end+1) = Rh_final(end);
    RS(end+1) = Rs_final(end);
    ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
    end
end

% Make a table
Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
FileName = append('HeatmapV_BA_BA_k_',num2str(k),'_delta_',num2str(delta),'.xlsx');
writetable(Table, FileName);
xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 8;
% % Read Probability (MAS) table
% Th = readtable("Poisson k=8.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Power k=8.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_ER_BA_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 8;
% % Read Probability (MAS) table
% Th = readtable("Power k=8.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Poisson k=8.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_BA_ER_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 8;
% % Read Probability (MAS) table
% Th = readtable("Poisson k=8.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Poisson k=8.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_ER_ER_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 16;
% % Read Probability (MAS) table
% Th = readtable("Power k=16.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Power k=16.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_BA_BA_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 16;
% % Read Probability (MAS) table
% Th = readtable("Poisson k=16.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Power k=16.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_ER_BA_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 16;
% % Read Probability (MAS) table
% Th = readtable("Power k=16.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Poisson k=16.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_BA_ER_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
% %%
% k = 16;
% % Read Probability (MAS) table
% Th = readtable("Poisson k=16.xlsx");
% Ph = Th.Probability;
% 
% Tr = readtable("Poisson k=16.xlsx");  % Poisson, Power
% Pr = Tr.Probability;
% 
% % for HeatMap
% PAIA = [];
% BETAH = [];
% VH = [];
% RH = [];
% RS = [];
% ASP = [];
% 
% for paia = 0:0.05:1
%     for betah = 0:0.05:1
% 
%     [t, Sh_final, Vh_final, Eh_final, Ih_final, Th_final, Rh_final, Rs_final, Sr_final, Er_final, Ir_final] = MonkeypoxV_discrete(agent, Ph, Pr, k, betah, betar, alphah, alphar, gammah, gammar, paia, paih, x, y, omega, theta, eta, m, Cv, Ct, delta, B, A, Sh0, Vh0, Eh0, Ih0, Th0, Rh0, Rs0, Sr0, Er0, Ir0, time_increment, tf);
%     PAIA(end+1) = paia;
%     BETAH(end+1) = betah;
%     VH(end+1) = Vh_final(end);
%     RH(end+1) = Rh_final(end);
%     RS(end+1) = Rs_final(end);
%     ASP(end+1) =  - Cv * Vh_final(end) - Ct * Th_final(end) - Rh_final(end);
%     end
% end
% 
% % Make a table
% Table = table(transpose(PAIA), transpose(BETAH), transpose(VH), transpose(RH), transpose(RS), transpose(ASP));
% FileName = append('HeatmapV_ER_ER_k_',num2str(k),'_paih_',num2str(paih),'_eta_',num2str(eta),'.xlsx');
% writetable(Table, FileName);
% xlswrite(FileName, ["paia", "betah", "Vh", "Rh", "Rs", "asp"], 'A1:F1');
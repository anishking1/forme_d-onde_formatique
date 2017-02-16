close all;
clear all;

Tduration = 0.05;
Fs = 0.1e6;
Ts = 1/Fs;
A =0.029;
Fc = 1.764e3;
BW = 45;
k = 0.002;
init_phase =0;

t = [0:Ts:Tduration];
output = zeros(1,length(t));
B = pi/k;
Alpha = pi*BW;
Wc = 2*pi*Fc;
attack_index = round(k/Ts);

output(1:attack_index) = A*0.5*(1-cos(B.*t(1:attack_index))).* exp(-Alpha.*t(1:attack_index)) .* sin(Wc.*t(1:attack_index) + init_phase);

output(attack_index+1:end) = A*exp(-Alpha.*t(attack_index+1:end)) .* sin(Wc.*t(attack_index+1:end) + init_phase);

figure(1)
plot(t,output)
    %%%%% Lable the plots %%%%%%%%%%%
set(gca,'FontName','Times','FontSize', 16,'FontWeight','bold')
title('Formant output waveform','FontName','Times','fontweight','bold','fontsize',16);
ylabel('Output','FontName','Times','fontweight','bold','fontsize',16);
xlabel('Time(s)','FontName','Times','fontweight','bold','fontsize',16);
%legend ( {'Measurements','Simulation'} ,'FontName','Times','FontSize', 14,'FontWeight','bold','Location','east');
grid on
grid minor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% print -painters -dpdf -r600 P1dB_vs_freq.pdf
fig_save_png(8,6,'formant_waveform.png');
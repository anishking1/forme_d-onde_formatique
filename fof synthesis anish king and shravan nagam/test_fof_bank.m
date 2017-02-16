clear all;
close all;

Fs = 40e3;
Ts = 1/Fs;
Tduration = 2e3*Ts;
time = [0:Ts:Tduration];
num_of_formants = 5;
Fc = [260 1764 2510 3090 3310];
A = [0.029 0.021 0.0146 0.011 0.00061];
BW = [70 45 80 130 150];
k = [2e-3 1.5e-3 1.5e-3 3e-3 1e-3]; %%% Attack duration vector
init_phase = [0 0 0 0 0];
output = zeros(num_of_formants, length(time));
t = zeros(num_of_formants, length(time));

for i = 1:num_of_formants
[output(i,:),t(i,:)] = Formant_function(Tduration,Ts, Fc(i), A(i), BW(i), k(i),init_phase(i));
end

cumulative_output = sum(output);



figure(2)
plot(1e3*t(1,:),cumulative_output)
    %%%%% Lable the plots %%%%%%%%%%%
set(gca,'FontName','Times','FontSize', 16,'FontWeight','bold')
title('FoF impulse response','FontName','Times','fontweight','bold','fontsize',16);
ylabel('Output','FontName','Times','fontweight','bold','fontsize',16);
xlabel('Time(ms)','FontName','Times','fontweight','bold','fontsize',16);
%legend ( {'Measurements','Simulation'} ,'FontName','Times','FontSize', 14,'FontWeight','bold','Location','east');
grid on
grid minor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig_save_png(8,6,'fof_waveform.png');

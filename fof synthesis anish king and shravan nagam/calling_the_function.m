% clear all;
% close all;
function[cumulative_output] = calling_the_function(Fs,Tduration,Amplitude);

% Fs = 1e5;
Ts = 1/Fs;
% Tduration = 1e4*Ts;
time = [0:Ts:Tduration];
num_of_formants = 5;
Fc = [260 1764 2510 3090 3310];
A = [0.029 0.021 0.0146 0.011 0.00061];
BW = [70 45 80 130 150];
k = [2e-3 1.5e-3 1.5e-3 3e-3 1e-3]; %%% Attack duration vector
init_phase = [0 0 0 0 0];
output = zeros(num_of_formants, length(time));
t = zeros(num_of_formants, length(time));
% Fc = 1764;
% A = 0.021;
% BW = 45;
% k = 1.5e-3; %%% Attack duration
% init_phase = 0; %%% Initial phase in radians

for i = 1:num_of_formants
[output(i,:),t(i,:)] = Formant_function(Tduration,Ts, Fc(i), A(i), BW(i), k(i),init_phase(i));
end

cumulative_output = Amplitude*sum(output);

% plot(t(1,:),cumulative_output)
% figure
% plot(abs(fft(cumulative_output, (1+Tduration/Ts))));
% for i = 1:100
% sound(cumulative_output, Fs);
% pause(Tduration)
% end
%%%% Formant definition %%%%%%%

function [output,t] = Formant_function(Tduration, Ts, Fc, A, BW, k,init_phase)

t = [0:Ts:Tduration];
output = zeros(1,length(t));
B = pi/k;
Alpha = pi*BW;
Wc = 2*pi*Fc;
attack_index = round(k/Ts);

output(1:attack_index) = A*0.5*(1-cos(B.*t(1:attack_index))).* exp(-Alpha.*t(1:attack_index)) .* sin(Wc.*t(1:attack_index) + init_phase);

output(attack_index+1:end) = A*exp(-Alpha.*t(attack_index+1:end)) .* sin(Wc.*t(attack_index+1:end) + init_phase);

end

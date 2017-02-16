Total_sound_time = 10;
F_pitch = 300;
T_pitch = 1/F_pitch;
Fs = 1e5;
Ts = 1/Fs;
Final_output = zeros(1,round(Total_sound_time/Ts + 1));
%Amplitude = [0:T_pitch/Total_sound_time:1];
Amplitude = rand(length(Final_output),1);

for i = 1:(Total_sound_time-1)/T_pitch;
    cumulative_output = calling_the_function(Fs,10*T_pitch,Amplitude(i));
    start_index = round(i*T_pitch/Ts);
    length = round(10*T_pitch/Ts);
    Final_output(start_index:start_index+length) = Final_output(start_index:start_index+length) +  cumulative_output;
end

sound(Final_output, Fs);
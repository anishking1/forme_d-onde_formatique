% fof.m forme d'onde formantique filter-based sound synthesis technique
% code by anish king awk2123 and shravan nagam sn2597



warning('off','all')
warning

close all;
clear all;
clc;

%%%% Inputs to the code %%%%%%%%%%%%%%%%%%%%
volume = 10; %%% Set the volume of the output
Fs = 40e3; %%% Input sampling rate
nBits = 16; %%%% resolution of the input ADC
record_time = 10; %%% Recording time in secongs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Acquiring the data %%%%%%%%%%%%%%%%%%%%%
myVoice = audiorecorder(Fs,nBits,1);
chunk_length = 0.3e-3;
generation_time = 10e-3;
threshold_setting = 0.3;



% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
myVoice.StopFcn = 'disp(''End of recording.'')';

record(myVoice, record_time);
pause(record_time*1.5)
audiodata = getaudiodata(myVoice);



Ts = 1/Fs;
audio_length = round(record_time/Ts) ;
n_chunks = round(audio_length/(chunk_length/Ts));
peaks_global = zeros(1,1);
time_stamps_global = zeros(1,1);

%%%% Extracting the impulse train %%%%%%%%%%%%%
for i = 0:(n_chunks-2)
   
    vector_now = audiodata(1+i*round(chunk_length/Ts) : 1+(i+1)*round(chunk_length/Ts));
    peak_now = max(vector_now);
    threshold_now = threshold_setting*peak_now;
    [pks, locs] = findpeaks(vector_now,'MinPeakHeight',threshold_now);
    time_stamps = locs.*Ts+(i*chunk_length);
    peaks_global = vertcat(peaks_global,pks);
    time_stamps_global = vertcat(time_stamps_global,time_stamps);
end   
     

Final_output = zeros(1,round((record_time+2*generation_time)/Ts));

%%%%% Creating the output of the FoF synthesizer %%%%%%%%%%%%%%%%%
for j = 1:length(time_stamps_global)
    cumulative_output = calling_the_function(Fs,generation_time,peaks_global(j));
    start_index = time_stamps_global(j)/Ts;
    length_now = length(cumulative_output);
    Final_output(start_index+1:start_index+length_now) = Final_output(start_index+1:start_index+length_now) +  cumulative_output;

end   

%%% Play the sound %%%%%%%%%
sound(volume*Final_output(1:audio_length), Fs);


%%%%% Plotting the values %%%%%%%%%%%%%%%%
figure(1)
subplot(3,1,1)
plot(Ts*(1:audio_length),audiodata)
 %%%%% Lable the plots %%%%%%%%%%%
set(gca,'FontName','Times','FontSize', 16,'FontWeight','bold')
title('Input voice waveform','FontName','Times','fontweight','bold','fontsize',16);
ylabel('Input','FontName','Times','fontweight','bold','fontsize',16);
xlabel('Time(s)','FontName','Times','fontweight','bold','fontsize',16);
%legend ( {'Measurements','Simulation'} ,'FontName','Times','FontSize', 14,'FontWeight','bold','Location','east');
grid on
grid minor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,1,2)
plot(time_stamps_global,peaks_global)
 %%%%% Lable the plots %%%%%%%%%%%
set(gca,'FontName','Times','FontSize', 16,'FontWeight','bold')
title('Extracted impulse train','FontName','Times','fontweight','bold','fontsize',16);
ylabel('Amplitude','FontName','Times','fontweight','bold','fontsize',16);
xlabel('Time(s)','FontName','Times','fontweight','bold','fontsize',16);
%legend ( {'Measurements','Simulation'} ,'FontName','Times','FontSize', 14,'FontWeight','bold','Location','east');
grid on
grid minor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,1,3)
plot(Ts*(1:audio_length),volume*Final_output(1:audio_length));
 %%%%% Lable the plots %%%%%%%%%%%
set(gca,'FontName','Times','FontSize', 16,'FontWeight','bold')
title('Synthesizer output waveform','FontName','Times','fontweight','bold','fontsize',16);
ylabel('Output','FontName','Times','fontweight','bold','fontsize',16);
xlabel('Time(s)','FontName','Times','fontweight','bold','fontsize',16);
%legend ( {'Measurements','Simulation'} ,'FontName','Times','FontSize', 14,'FontWeight','bold','Location','east');
grid on
grid minor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig_save_png(8,6,'system_waveform.png');





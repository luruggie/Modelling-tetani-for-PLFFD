%% deriving time difference in the peak of the stimuli
if npulses_10hz == 4;
    experimental_peaks_10hz = local_maxima_index_10hz(1:4);
    for i = 3:1:npulses_10hz;
        experimental_ipi_10hz(i-2) = experimental_peaks_10hz(i) - experimental_peaks_10hz(i-1);
    end
elseif npulses_10hz == 5;
    experimental_peaks_10hz = local_maxima_index_10hz(1:5);
    for i = 3:1:npulses_10hz;
        experimental_ipi_10hz(i-2) = experimental_peaks_10hz(i) - experimental_peaks_10hz(i-1);
    end
elseif npulses_10hz == 7;
    experimental_peaks_10hz = local_maxima_index_10hz(1:7);
    for i = 3:1:npulses_10hz;
        experimental_ipi_10hz(i-2) = experimental_peaks_10hz(i) - experimental_peaks_10hz(i-1);
    end
elseif npulses_10hz == 10;
    experimental_peaks_10hz = local_maxima_index_10hz(1:10);
    for i = 3:1:npulses_10hz;
        experimental_ipi_10hz(i-2) = experimental_peaks_10hz(i) - experimental_peaks_10hz(i-1);
    end
end

%% model 10hz trace with the number of pulses selected. Take variables from Bobet & Stein, 2005, and optimize tau_c;
% definition of inital parameters;
modelling_resolution_time = 1;
tau_1 = tau_1_derived_mean;

tau_c_array = [1:1:50];

r_zero = 9.4;
a = 1.295;
tau_2 = 90;
k_m = 0.15;

%% definition of stimulation paradigm
stimulation_hz = 10;
number_of_stimuli = npulses_10hz;
isi = 1000/stimulation_hz;
train_duration = number_of_stimuli * isi;

%% create time scales
t_first_stimulus = 200;
t = 0:modelling_resolution_time:(train_duration + t_first_stimulus + 500);
t_stimuli = t_first_stimulus:isi:((t_first_stimulus + (isi .* number_of_stimuli)) - isi);
t_last_stimulus = t_stimuli (end);

%simulation of force with different tau_c

model_peaks_10hz = [];
delay = [];
sum_delay_squared = [];
average_delay = [];
average_shift_model_exp = [];

for o1= 1:1:length(tau_c_array);
    tau_c = tau_c_array(o1);
    % determination of r
    i = 1:1:number_of_stimuli;
    r(1) = 1;
    
    for j = 2:1:length(i);
        r(j) = 1 + ((r_zero - 1).*(exp(-isi/tau_c)));
    end
    
    % determination of n
    t_temp = [];
    n = [];
    
    for k = 1:1:length(t);
        t_temp = t(k);    
        if t_temp < t_first_stimulus;
            n(k) = 0;
        elseif t_temp >= t_first_stimulus & t_temp < t_last_stimulus ;
            n(k) = floor(((t_temp - t_first_stimulus) ./ isi)+0.001) +1;
        else
            n(k) = number_of_stimuli;
        end
    end
    
    % determination of cn
    cn = [];
    
    
    for l = 1:1:length(t);
        if n(l) == 0;
            cn(l) = 0;
        elseif n(l) > 0;
            cn_temp = [];
            for m = 1:1:n(l);
                cn_temp(m) = r(m) .* ((t(l) - t_stimuli(m))/tau_c) .* (exp((-1/tau_c) .* (t(l) - t_stimuli(m))));
            end
            cn(l) = sum(cn_temp);
        end
    end
    
    % calculation of force
    force_model = [];
    force_model(1) = 0;
    dfdt = [];
    
    for m = 1:1:(length(t)-1);
        dfdt(m) = ((a .* cn(m))/(k_m + cn(m))) - (force_model(m) ./ (tau_1 + (tau_2 .* (cn(m) ./ (k_m + cn(m))))));
        force_model(m+1) = force_model(m) + dfdt(m);
    end
    
    peak_force_model = max(force_model);
    quarter_peak_force_model = 0.25 .* peak_force_model;
    [force_peaks_model_temp,peaks_index_model_temp] = findpeaks(force_model);
    
    o2 = 1;
    force_peaks_model = [];
    peaks_index_model = [];
    
    for o3 = 1:1:length(peaks_index_model_temp);
        if force_peaks_model_temp(o3) > quarter_peak_force_model;
            force_peaks_model(o2) = force_peaks_model_temp(o3); 
            peaks_index_model(o2) = peaks_index_model_temp(o3);
            o2 = o2+1;
        end
    end
    
    if length(peaks_index_model) == npulses_10hz;
        model_peaks_10hz = [];
        
        for o4 = 3:1:npulses_10hz;
            model_ipi_10hz(o4-2) = peaks_index_model(o4) - peaks_index_model(o4-1);
        end
        
        delay = [];
        
        for o5 = 1:1:length(model_ipi_10hz);
            delay(o5) = model_ipi_10hz(o5) - experimental_ipi_10hz(o5);
        end
        
        average_delay(o1) = mean(delay);
        sum_delay_squared(o1) = sum(delay.^2);
        average_shift_model_exp(o1) = mean(peaks_index_model(3:end)-experimental_peaks_10hz(3:end));
    else
        sum_delay_squared(o1) = 1000;
        average_delay(o1) = 1000;
        average_shift_model_exp(o1) = 1000;
    end
end

[min_sum_delay_squared_tau_c,min_sum_delay_squared_index_tau_c] = min(sum_delay_squared);

% determining tau c
figure(4);
plot(tau_c_array,sum_delay_squared);
hold on
plot(min_sum_delay_squared_index_tau_c,min_sum_delay_squared_tau_c,'or','MarkerFaceColor','r');
xlabel('Tau c (msec)');
ylabel('Sum delay squared');

if computing_iteration == 1;
    tau_c_optimal = input('optimal tau c');
end

tau_c = tau_c_optimal;
optimal_sum_delay_squared = sum_delay_squared(tau_c); 
optimal_average_delay = average_delay(tau_c);
optimal_average_shift_model_exp = floor(average_shift_model_exp(tau_c));

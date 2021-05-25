%% simulation of 10 hz tetanus
% definition of stimulation paradigm
stimulation_hz = 10;
number_of_stimuli = 10;
isi = 1000/stimulation_hz;
train_duration = number_of_stimuli * isi;

% create time scales
t_first_stimulus = 200;
t = 0:modelling_resolution_time:(train_duration + t_first_stimulus + 500);
t_stimuli = t_first_stimulus:isi:((t_first_stimulus + (isi .* number_of_stimuli)) - isi);
t_last_stimulus = t_stimuli (end);

% assgin variable values
modelling_resolution_time = 1;
tau_c = tau_c;
tau_1 = tau_1;
r_zero = r_zero_selected;
k_m = k_m_selected;
a = a_selected;
tau_2 = tau_2_selected;


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

force_model_10hz = force_model;
peak_force_model_10hz_tetanus = max(force_model_10hz);


%% simulation of 100 hz tetanus
% definition of stimulation paradigm
stimulation_hz = 100;
number_of_stimuli = 100;
isi = 1000/stimulation_hz;
train_duration = number_of_stimuli * isi;

% create time scales
t_first_stimulus = 200;
t = 0:modelling_resolution_time:(train_duration + t_first_stimulus + 500);
t_stimuli = t_first_stimulus:isi:((t_first_stimulus + (isi .* number_of_stimuli)) - isi);
t_last_stimulus = t_stimuli (end);

% assgin variable values
modelling_resolution_time = 1;
tau_c = tau_c;
tau_1 = tau_1;
r_zero = r_zero_selected;
k_m = k_m_selected;
a = a_selected;
tau_2 = tau_2_selected;


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

force_model_100hz = force_model;
peak_force_model_100hz_tetanus = max(force_model_100hz);

% Shift the experimental 100 hz signal with 100 pulses
shifted_mean_force_100hz_100p(1:(optimal_average_shift_model_exp)) = 0;
for i = (optimal_average_shift_model_exp+1):1:length(mean_force_10hz);
    shifted_mean_force_100hz_100p(i) = mean_force_100p(i-optimal_average_shift_model_exp);
end

%% Plotting experimental and simulated tetani
hold off
figure(10);
plot(shifted_mean_force_10hz);
hold on
plot (force_model_10hz);
axis([0 2000 0 40]);

hold off
figure(11);
plot(shifted_mean_force_100hz_100p);
hold on
axis([0 2000 0 40]);
plot (force_model_100hz);            
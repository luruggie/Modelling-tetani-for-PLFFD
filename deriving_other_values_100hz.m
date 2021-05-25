%% Shift the experimental 100 hz signal
shifted_mean_force_100hz(1:(optimal_average_shift_model_exp)) = 0;
for i = (optimal_average_shift_model_exp+1):1:length(mean_force_10hz);
    if npulses_100hz == 2;
        shifted_mean_force_100hz(i) = mean_force_2p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 4;
        shifted_mean_force_100hz(i) = mean_force_4p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 7;
        shifted_mean_force_100hz(i) = mean_force_7p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 12;
        shifted_mean_force_100hz(i) = mean_force_12p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 25;
        shifted_mean_force_100hz(i) = mean_force_25p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 50;
        shifted_mean_force_100hz(i) = mean_force_50p(i-optimal_average_shift_model_exp);
    elseif npulses_100hz == 100;
        shifted_mean_force_100hz(i) = mean_force_100p(i-optimal_average_shift_model_exp);
    end
end

peak_force_experimental_100hz = max(shifted_mean_force_100hz);

%% definition of stimulation paradigm
stimulation_hz = 100;
number_of_stimuli = npulses_100hz;
isi = 1000/stimulation_hz;
train_duration = number_of_stimuli * isi;

%% create time scales
t_first_stimulus = 200;
t = 0:modelling_resolution_time:(train_duration + t_first_stimulus + 1000);
t_stimuli = t_first_stimulus:isi:((t_first_stimulus + (isi .* number_of_stimuli)) - isi);
t_last_stimulus = t_stimuli (end);

%% Preliminary range of tau2, km, r, and A to optimize the time of the peak forces
%Reconstruct force trace using tau_1_derived
modelling_resolution_time = 1;
tau_c = tau_c;
tau_1 = tau_1;

r_zero_array = [1:0.5:6];
k_m_array = [0.1:0.05:2];
a_array = [0.1:0.02:1];
tau_2_array = [10:4:90];

o1 = [];
o2 = [];
o3 = [];
o4 = [];
n_iteration = 0;
n_iteration_2 = 1;
diff_squared_100hz = [];
diff_peak_force_100hz = [];
indices_for_selection_100hz = [];
simulated_values_100hz = [];

for o1 = 1:1:length(r_zero_array);
    r_zero = r_zero_array(o1);
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
    
    for o2 = 1:1:length(k_m_array);
        k_m = k_m_array(o2);
        for o3 = 1:1:length(a_array);
            a = a_array(o3);
            for o4 = 1:1:length(tau_2_array);
                tau_2 = tau_2_array(o4);
                % calculation of force
                force_model = [];
                force_model(1) = 0;
                dfdt = [];
                for m = 1:1:(length(t)-1);
                    dfdt(m) = ((a .* cn(m))/(k_m + cn(m))) - (force_model(m) ./ (tau_1 + (tau_2 .* (cn(m) ./ (k_m + cn(m))))));
                    force_model(m+1) = force_model(m) + dfdt(m);
                end
                
               
                n_iteration = n_iteration+1;
                peak_force_model_100hz(n_iteration) = max(force_model);
                diff_squared_100hz(n_iteration) = sum(((force_model(200:1000) - shifted_mean_force_100hz(200:1000)).^2));
                diff_peak_force_100hz(n_iteration) = peak_force_model_100hz(n_iteration) - peak_force_experimental_100hz;
                simulated_values_100hz(1,n_iteration) = r_zero;
                simulated_values_100hz(2,n_iteration) = k_m; 
                simulated_values_100hz(3,n_iteration) = a; 
                simulated_values_100hz(4,n_iteration) = tau_2;
                
                if diff_peak_force_100hz(n_iteration) > -(0.025 * peak_force_experimental_100hz) && diff_peak_force_100hz(n_iteration) < (0.025 * peak_force_experimental_100hz);
                    indices_for_selection_100hz(n_iteration_2) = n_iteration;
                    n_iteration_2 = n_iteration_2 + 1;
                end
            end
        end
    end
end

figure(8);
plot(diff_squared_100hz);
axis([0 400000 0 500]); 

figure(9);
plot(diff_peak_force_100hz);
axis([0 400000 -10 10]); 

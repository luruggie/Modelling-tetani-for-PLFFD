%% This script must run when data have been imported

last_peak_mean_force_10hz = [];
half_peak_mean_force_10hz = [];
quarter_peak_mean_force_10hz = [];

last_peak_mean_force_25p = [];
half_peak_mean_force_25p = [];
quarter_peak_mean_force_25p = [];

last_peak_mean_force_12p = [];
half_peak_mean_force_12p = [];
quarter_peak_mean_force_12p = [];

last_peak_mean_force_2p = [];
half_peak_mean_force_2p = [];
quarter_peak_mean_force_2p = [];

last_peak_mean_force_50p = [];
half_peak_mean_force_50p = [];
quarter_peak_mean_force_50p = [];

last_peak_mean_force_7p = [];
half_peak_mean_force_7p = [];
quarter_peak_mean_force_7p = [];

last_peak_mean_force_4p = [];
half_peak_mean_force_4p = [];
quarter_peak_mean_force_4p = [];

last_peak_mean_force_100p = [];
half_peak_mean_force_100p = [];
quarter_peak_mean_force_100p = [];


[peak_force_10hz,maximum_index_10hz] = max(mean_force_10hz);
[peak_force_25p,maximum_index_25p] = max(mean_force_25p);
[peak_force_12p,maximum_index_12p] = max(mean_force_12p);
[peak_force_2p,maximum_index_2p] = max(mean_force_2p);
[peak_force_50p,maximum_index_50p] = max(mean_force_50p);    
[peak_force_7p,maximum_index_7p] = max(mean_force_7p);
[peak_force_4p,maximum_index_4p] = max(mean_force_4p);
[peak_force_100p,maximum_index_100p] = max(mean_force_100p);

half_peak_force_10hz = 0.5 .* peak_force_10hz;quarter_peak_force_10hz = 0.25 .* peak_force_10hz;

half_peak_force_25p = 0.5 .* peak_force_25p;quarter_peak_force_25p = 0.25 .* peak_force_25p;

half_peak_force_12p = 0.5 .* peak_force_12p;quarter_peak_force_12p = 0.25 .* peak_force_12p;

half_peak_force_2p = 0.5 .* peak_force_2p;quarter_peak_force_2p = 0.25 .* peak_force_2p;

half_peak_force_50p = 0.5 .* peak_force_50p;quarter_peak_force_50p = 0.25 .* peak_force_50p;

half_peak_force_7p = 0.5 .* peak_force_7p;quarter_peak_force_7p = 0.25 .* peak_force_7p;

half_peak_force_4p = 0.5 .* peak_force_4p;quarter_peak_force_4p = 0.25 .* peak_force_4p;

half_peak_force_100p = 0.5 .* peak_force_100p;quarter_peak_force_100p = 0.25 .* peak_force_100p;
    

% cut the part of the trace between half of the peak force and a quarter
force_decay_10hz = []; time_decay_10hz = [];
force_decay_25p = []; time_decay_25p = [];
force_decay_12p = []; time_decay_12p = [];
force_decay_2p = []; time_decay_2p = [];
force_decay_50p = []; time_decay_50p = [];
force_decay_7p = []; time_decay_7p = [];
force_decay_4p = []; time_decay_4p = [];
force_decay_100p = []; time_decay_100p = [];

for i = maximum_index_10hz(end):1:size(mean_force_all_trains,1);
    if mean_force_10hz(i) <= half_peak_force_10hz & mean_force_10hz(i) >= quarter_peak_force_10hz;
        force_decay_10hz(length(force_decay_10hz)+1,1) = mean_force_10hz(i);
        time_decay_10hz(length(time_decay_10hz)+1,1) = time_ms(i);
    end
end

for i = maximum_index_25p(end):1:size(mean_force_all_trains,1);
    if mean_force_25p(i) <= half_peak_force_25p & mean_force_25p(i) >= quarter_peak_force_25p;
        force_decay_25p(length(force_decay_25p)+1,1) = mean_force_25p(i);
        time_decay_25p(length(time_decay_25p)+1,1) = time_ms(i);
    end
end

for i = maximum_index_12p(end):1:size(mean_force_all_trains,1);
    if mean_force_12p(i) <= half_peak_force_12p & mean_force_12p(i) >= quarter_peak_force_12p;
        force_decay_12p(length(force_decay_12p)+1,1) = mean_force_12p(i);
        time_decay_12p(length(time_decay_12p)+1,1) = time_ms(i);
    end
end

for i = maximum_index_2p(end):1:size(mean_force_all_trains,1);
    if mean_force_2p(i) <= half_peak_force_2p & mean_force_2p(i) >= quarter_peak_force_2p;
        force_decay_2p(length(force_decay_2p)+1,1) = mean_force_2p(i);
        time_decay_2p(length(time_decay_2p)+1,1) = time_ms(i);
    end
end

for i = maximum_index_50p(end):1:size(mean_force_all_trains,1);
    if mean_force_50p(i) <= half_peak_force_50p & mean_force_50p(i) >= quarter_peak_force_50p;
        force_decay_50p(length(force_decay_50p)+1,1) = mean_force_50p(i);
        time_decay_50p(length(time_decay_50p)+1,1) = time_ms(i);
    end
end

for i = maximum_index_7p(end):1:size(mean_force_all_trains,1);
    if mean_force_7p(i) <= half_peak_force_7p & mean_force_7p(i) >= quarter_peak_force_7p;
        force_decay_7p(length(force_decay_7p)+1,1) = mean_force_7p(i);
        time_decay_7p(length(time_decay_7p)+1,1) = time_ms(i);
    end
end

for i = maximum_index_4p(end):1:size(mean_force_all_trains,1);
    if mean_force_4p(i) <= half_peak_force_4p & mean_force_4p(i) >= quarter_peak_force_4p;
        force_decay_4p(length(force_decay_4p)+1,1) = mean_force_4p(i);
        time_decay_4p(length(time_decay_4p)+1,1) = time_ms(i);
    end;
end

for i = maximum_index_100p(end):1:size(mean_force_all_trains,1);
    if mean_force_100p(i) <= half_peak_force_100p & mean_force_100p(i) >= quarter_peak_force_100p;
        force_decay_100p(length(force_decay_100p)+1,1) = mean_force_100p(i);
        time_decay_100p(length(time_decay_100p)+1,1) = time_ms(i);
    end
end

ln_force_decay_10hz = log(force_decay_10hz);
ln_force_decay_25p = log(force_decay_25p);
ln_force_decay_12p = log(force_decay_12p);
ln_force_decay_2p = log(force_decay_2p);
ln_force_decay_50p = log(force_decay_50p);
ln_force_decay_7p = log(force_decay_7p);
ln_force_decay_4p = log(force_decay_4p);
ln_force_decay_100p = log(force_decay_100p);

% linear regression of ln_force_decay vs t
[curve_10hz,gof_10hz] = fit(ln_force_decay_10hz,time_decay_10hz,'poly1');
coefficient_10hz = coeffvalues(curve_10hz);
tau_1_derived_10hz = coefficient_10hz(1);
intersection_10hz = coefficient_10hz(2);

[curve_25p,gof_25p] = fit(ln_force_decay_25p,time_decay_25p,'poly1');
coefficient_25p = coeffvalues(curve_25p);
tau_1_derived_25p = coefficient_25p(1);
intersection_25p = coefficient_25p(2);

[curve_12p,gof_12p] = fit(ln_force_decay_12p,time_decay_12p,'poly1');
coefficient_12p = coeffvalues(curve_12p);
tau_1_derived_12p = coefficient_12p(1);
intersection_12p = coefficient_12p(2);

[curve_2p,gof_2p] = fit(ln_force_decay_2p,time_decay_2p,'poly1');
coefficient_2p = coeffvalues(curve_2p);
tau_1_derived_2p = coefficient_2p(1);
intersection_2p = coefficient_2p(2);

[curve_50p,gof_50p] = fit(ln_force_decay_50p,time_decay_50p,'poly1');
coefficient_50p = coeffvalues(curve_50p);
tau_1_derived_50p = coefficient_50p(1);
intersection_50p = coefficient_50p(2);

[curve_7p,gof_7p] = fit(ln_force_decay_7p,time_decay_7p,'poly1');
coefficient_7p = coeffvalues(curve_7p);
tau_1_derived_7p = coefficient_7p(1);
intersection_7p = coefficient_7p(2);

[curve_4p,gof_4p] = fit(ln_force_decay_4p,time_decay_4p,'poly1');
coefficient_4p = coeffvalues(curve_4p);
tau_1_derived_4p = coefficient_4p(1);
intersection_4p = coefficient_4p(2);

[curve_100p,gof_100p] = fit(ln_force_decay_100p,time_decay_100p,'poly1');
coefficient_100p = coeffvalues(curve_100p);
tau_1_derived_100p = coefficient_100p(1);
intersection_100p = coefficient_100p(2);

% put tau_1_derived values in a matrix
tau_1_derived = abs([tau_1_derived_10hz,tau_1_derived_25p,tau_1_derived_12p,tau_1_derived_2p,tau_1_derived_50p,tau_1_derived_7p,tau_1_derived_4p,tau_1_derived_100p]);

tau_1_derived_mean = mean(tau_1_derived);
tau_1 = tau_1_derived_mean;
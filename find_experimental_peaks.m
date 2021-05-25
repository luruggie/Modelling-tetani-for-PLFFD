smoothed_mean_force_10hz = [];
smoothed_mean_force_25p = [];
smoothed_mean_force_12p = [];
smoothed_mean_force_2p = [];
smoothed_mean_force_50p = [];    
smoothed_mean_force_7p = [];
smoothed_mean_force_4p = [];
smoothed_mean_force_100p = [];

for i = 1:1:length(mean_force_10hz);
    if i > 5 & i < (length(mean_force_10hz) - 5);
        smoothed_mean_force_10hz(i) = (mean_force_10hz(i-1) + mean_force_10hz(i) + mean_force_10hz(i+1))/3;
        smoothed_mean_force_25p(i) = (mean_force_25p(i-1) + mean_force_25p(i) + mean_force_25p(i+1))/3;
        smoothed_mean_force_12p(i) = (mean_force_12p(i-1) + mean_force_12p(i) + mean_force_12p(i+1))/3;
        smoothed_mean_force_2p(i) = (mean_force_2p(i-1) + mean_force_2p(i) + mean_force_2p(i+1))/3;
        smoothed_mean_force_50p(i) = (mean_force_50p(i-1) + mean_force_50p(i) + mean_force_50p(i+1))/3;
        smoothed_mean_force_7p(i) = (mean_force_7p(i-1) + mean_force_7p(i) + mean_force_7p(i+1))/3;
        smoothed_mean_force_4p(i) = (mean_force_4p(i-1) + mean_force_4p(i) + mean_force_4p(i+1))/3;
        smoothed_mean_force_100p(i) = (mean_force_100p(i-1) + mean_force_100p(i) + mean_force_100p(i+1))/3;
    else
        smoothed_mean_force_10hz(i) = mean_force_10hz(i);
        smoothed_mean_force_25p(i) = mean_force_25p(i);
        smoothed_mean_force_12p(i) = mean_force_12p(i);
        smoothed_mean_force_2p(i) = mean_force_2p(i);
        smoothed_mean_force_50p(i) = mean_force_50p(i);
        smoothed_mean_force_7p(i) = mean_force_7p(i);
        smoothed_mean_force_4p(i) = mean_force_4p(i);
        smoothed_mean_force_100p(i) = mean_force_100p(i);
    end
end

figure(3);
plot(smoothed_mean_force_10hz); hold on;
plot(smoothed_mean_force_25p); hold on;
plot(smoothed_mean_force_12p); hold on;
plot(smoothed_mean_force_2p); hold on;
plot(smoothed_mean_force_50p); hold on;
plot(smoothed_mean_force_7p); hold on;
plot(smoothed_mean_force_4p);hold on;
plot(smoothed_mean_force_100p);hold on;

[local_maxima_force_10hz_temp,local_maxima_index_10hz_temp] = findpeaks(smoothed_mean_force_10hz);
[local_maxima_force_25p_temp,local_maxima_index_25p_temp] = findpeaks(smoothed_mean_force_25p);
[local_maxima_force_12p_temp,local_maxima_index_12p_temp] = findpeaks(smoothed_mean_force_12p);
[local_maxima_force_2p_temp,local_maxima_index_2p_temp] = findpeaks(smoothed_mean_force_2p);
[local_maxima_force_50p_temp,local_maxima_index_50p_temp] = findpeaks(smoothed_mean_force_50p);    
[local_maxima_force_7p_temp,local_maxima_index_7p_temp] = findpeaks(smoothed_mean_force_7p);
[local_maxima_force_4p_temp,local_maxima_index_4p_temp] = findpeaks(smoothed_mean_force_4p);
[local_maxima_force_100p_temp,local_maxima_index_100p_temp] = findpeaks(smoothed_mean_force_100p);

local_maxima_force_10hz = [];local_maxima_index_10hz = [];
local_maxima_force_25p = [];local_maxima_index_25p = [];
local_maxima_force_12p = [];local_maxima_index_12p = [];
local_maxima_force_2p = [];local_maxima_index_2p = [];
local_maxima_force_50p = [];local_maxima_index_50p = [];    
local_maxima_force_7p = [];local_maxima_index_7p = [];
local_maxima_force_4p = [];local_maxima_index_4p = [];
local_maxima_force_100p = [];local_maxima_index_100p = [];

index_2 = 1;
for i=1:1:length(local_maxima_index_10hz_temp);
    index = local_maxima_index_10hz_temp(i);
    if smoothed_mean_force_10hz(index) > quarter_peak_force_10hz & smoothed_mean_force_10hz(index) == max(smoothed_mean_force_10hz((index-5):(index+5)));
        if smoothed_mean_force_10hz(index) == smoothed_mean_force_10hz(local_maxima_index_10hz_temp(i+1)) || smoothed_mean_force_10hz(index) == smoothed_mean_force_10hz(local_maxima_index_10hz_temp(i+2));
        else
            local_maxima_force_10hz(index_2) = smoothed_mean_force_10hz(index);
            local_maxima_index_10hz(index_2) = local_maxima_index_10hz_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_25p_temp);
    index = local_maxima_index_25p_temp(i);
    if smoothed_mean_force_25p(index) > quarter_peak_force_25p & smoothed_mean_force_25p(index) == max(smoothed_mean_force_25p((index-10):(index+10)));
        if smoothed_mean_force_25p(index) == smoothed_mean_force_25p(local_maxima_index_25p_temp(i+1)) || smoothed_mean_force_25p(index) == smoothed_mean_force_25p(local_maxima_index_25p_temp(i+2));
        else
            local_maxima_force_25p(index_2) = smoothed_mean_force_25p(index);
            local_maxima_index_25p(index_2) = local_maxima_index_25p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_12p_temp);
    index = local_maxima_index_12p_temp(i);
    if smoothed_mean_force_12p(index) > quarter_peak_force_12p & smoothed_mean_force_12p(index) == max(smoothed_mean_force_12p((index-10):(index+10)));
        if smoothed_mean_force_12p(index) == smoothed_mean_force_12p(local_maxima_index_12p_temp(i+1)) || smoothed_mean_force_12p(index) == smoothed_mean_force_12p(local_maxima_index_12p_temp(i+2));
        else
            local_maxima_force_12p(index_2) = smoothed_mean_force_12p(index);
            local_maxima_index_12p(index_2) = local_maxima_index_12p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_2p_temp);
    index = local_maxima_index_2p_temp(i);
    if smoothed_mean_force_2p(index) > quarter_peak_force_2p & smoothed_mean_force_2p(index) == max(smoothed_mean_force_2p((index-10):(index+10)));
        if smoothed_mean_force_2p(index) == smoothed_mean_force_2p(local_maxima_index_2p_temp(i+1)) || smoothed_mean_force_2p(index) == smoothed_mean_force_2p(local_maxima_index_2p_temp(i+2));
        else
            local_maxima_force_2p(index_2) = smoothed_mean_force_2p(index);
            local_maxima_index_2p(index_2) = local_maxima_index_2p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_50p_temp);
    index = local_maxima_index_50p_temp(i);
    if smoothed_mean_force_50p(index) > quarter_peak_force_50p & smoothed_mean_force_50p(index) == max(smoothed_mean_force_50p((index-10):(index+10)));
        if smoothed_mean_force_50p(index) == smoothed_mean_force_50p(local_maxima_index_50p_temp(i+1)) || smoothed_mean_force_50p(index) == smoothed_mean_force_50p(local_maxima_index_50p_temp(i+2));
        else
            local_maxima_force_50p(index_2) = smoothed_mean_force_50p(index);
            local_maxima_index_50p(index_2) = local_maxima_index_50p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_7p_temp);
    index = local_maxima_index_7p_temp(i);
    if smoothed_mean_force_7p(index) > quarter_peak_force_7p & smoothed_mean_force_7p(index) == max(smoothed_mean_force_7p((index-10):(index+10)));
        if smoothed_mean_force_7p(index) == smoothed_mean_force_7p(local_maxima_index_7p_temp(i+1)) || smoothed_mean_force_7p(index) == smoothed_mean_force_7p(local_maxima_index_7p_temp(i+2));
        else
            local_maxima_force_7p(index_2) = smoothed_mean_force_7p(index);
            local_maxima_index_7p(index_2) = local_maxima_index_7p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_4p_temp);
    index = local_maxima_index_4p_temp(i);
    if smoothed_mean_force_4p(index) > quarter_peak_force_4p & smoothed_mean_force_4p(index) == max(smoothed_mean_force_4p((index-10):(index+10)));
        if smoothed_mean_force_4p(index) == smoothed_mean_force_4p(local_maxima_index_4p_temp(i+1)) || smoothed_mean_force_4p(index) == smoothed_mean_force_4p(local_maxima_index_4p_temp(i+2));
        else
            local_maxima_force_4p(index_2) = smoothed_mean_force_4p(index);
            local_maxima_index_4p(index_2) = local_maxima_index_4p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

index_2 = 1;
for i=1:1:length(local_maxima_index_100p_temp);
    index = local_maxima_index_100p_temp(i);
    if smoothed_mean_force_100p(index) > quarter_peak_force_100p & smoothed_mean_force_100p(index) == max(smoothed_mean_force_100p((index-10):(index+10)));
        if smoothed_mean_force_100p(index) == smoothed_mean_force_100p(local_maxima_index_100p_temp(i+1)) || smoothed_mean_force_100p(index) == smoothed_mean_force_100p(local_maxima_index_100p_temp(i+2));
        else
            local_maxima_force_100p(index_2) = smoothed_mean_force_100p(index);
            local_maxima_index_100p(index_2) = local_maxima_index_100p_temp(i);
            index_2 = index_2 + 1;
        end
    end
end

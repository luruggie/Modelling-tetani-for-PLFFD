selected_data_100hz = [];
selected_data_10hz = [];

% Data selection
if npulses_100hz == 2;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1) = [mean_force_2p(i)];
    end
elseif npulses_100hz == 4;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:2) = [mean_force_2p(i),mean_force_4p(i)];
    end
elseif npulses_100hz == 7;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:3) = [mean_force_2p(i),mean_force_4p(i),mean_force_7p(i)];
    end
elseif npulses_100hz == 12;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:4) = [mean_force_2p(i),mean_force_4p(i),mean_force_7p(i),mean_force_12p(i)];
    end
elseif npulses_100hz == 25;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:5) = [mean_force_2p(i),mean_force_4p(i),mean_force_7p(i),mean_force_12p(i),mean_force_25p(i)];
    end
elseif npulses_100hz == 50;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:6) = [mean_force_2p(i),mean_force_4p(i),mean_force_7p(i),mean_force_12p(i),mean_force_25p(i),mean_force_50p(i)];
    end
elseif npulses_100hz == 100;
    for i = 1:1:length(mean_force_2p);
        selected_data_100hz(i,1:7) = [mean_force_2p(i),mean_force_4p(i),mean_force_7p(i),mean_force_12p(i),mean_force_25p(i),mean_force_50p(i),mean_force_100p(i)];
    end
end

for i = 1:1:length(mean_force_2p);
    selected_data_10hz(i,1) = mean_force_10hz(i);
end


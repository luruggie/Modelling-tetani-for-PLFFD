%importing data
data = readmatrix('example_session.txt');

%defining frames
frame_10hz = [2,11];
frame_25p = [3,12];
frame_12p = [4,13];
frame_2p = [5,14];
frame_50p = [6,15];
frame_7p = [7,16];
frame_4p = [8,17];
frame_100p = [9,18];

%separating data by frames
time=[];
train=[];
baseline = [];

j = 1;
i = 1;
h = [];

for h = 1:1:size(data,1);
    if isnan(data(h,1)) == 1;
        j = j+1;
        i = 1;
    else 
        time_s(i,j) = data(h,1);
        train(i,j) = data(h,2);
        i = i+1;
    end
end

time_ms = time_s .* 1000;

% remove baseline and plotting
for j = 1:1:size(train,2);
    baseline(1,j) = mean(train((end-60):(end-10),j));
    train_net(:,j) = train(:,j)- baseline(1,j);
    figure(1);
    plot(time_ms(:,j),train_net(:,j));
    hold on;
end

% divide train matrix by type of stimulus
force_10hz = [];
force_25p = [];
force_12p = [];
force_2p = [];
force_50p = [];
force_7p = [];
force_4p = [];
force_100p = [];

for j = 1:1:length(frame_10hz);
    force_10hz = [force_10hz,train_net(:,frame_10hz(j))];
    force_25p = [force_25p,train_net(:,frame_25p(j))];
    force_12p = [force_12p,train_net(:,frame_12p(j))];
    force_2p = [force_2p,train_net(:,frame_2p(j))];
    force_50p = [force_50p,train_net(:,frame_50p(j))];
    force_7p = [force_7p,train_net(:,frame_7p(j))];
    force_4p = [force_4p,train_net(:,frame_4p(j))];
    force_100p = [force_100p,train_net(:,frame_100p(j))];
end

%calculation of mean traces for each condition
for i = 1:1:length(force_10hz);
    mean_force_10hz = mean(force_10hz,2);
    mean_force_25p = mean(force_25p,2);
    mean_force_12p = mean(force_12p,2);
    mean_force_2p = mean(force_2p,2);
    mean_force_50p = mean(force_50p,2);
    mean_force_7p = mean(force_7p,2);
    mean_force_4p = mean(force_4p,2);
    mean_force_100p = mean(force_100p,2);
end

mean_force_all_trains = [mean_force_10hz,mean_force_25p, mean_force_12p, mean_force_2p, mean_force_50p, mean_force_7p, mean_force_4p, mean_force_100p]; 
    % plot all traces
figure(2);
plot(mean_force_all_trains);


        
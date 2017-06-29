clc
clear all
%load('ExpInfo.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaring global variables for use in curvefit function
global EndFreq
global StartFreq
global timeDur
global TrialLength
global Resampledf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
timeDur = 10;          % Length of each Trial (secs)
SamplingFreq = 1000;   % Sampling Frequency (Hz)
TrialLength = timeDur*SamplingFreq;       % # of samples for each trial
trials = 10;                    % # of trials
StartFreq = .2;                         % Lower cutoff frequency of Perturbation (Hz)
sticFreq = 10;
EndFreq = 10;     % Upper cutoff frequency of Perturbation (Hz) - should not be lower than 5 or so.
NIterations = 100;    % Number of bootstrap fits - I would recommend starting at 100 to be sure it's working. 10000 takes about an hour to run.
offset = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis : Using Frequency Response Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Acc = 1;            % Setting a counter for accepted trials


for i = 1:trials
    
    % DATA INPUTS
    plant=load('theta_i.mat');
%      a(i)=load(['trial',num2str(i+offset),'.mat'],'position_feedback'); % position input
     posFeedback(:,i) = plant.theta_i(2:10001,(2*i));%a(i).position_feedback(1:end);
%      b(i)=load(['trial',num2str(i+offset),'.mat'],'noisePerturb');  % torque applied BY robot
%      noisePerturbation(:,i) = b(i).noisePerturb(1:end);
%      c(i)=load(['trial',num2str(i+offset),'.mat'],'measuredTorque');    % torque applied TO robot
     measTorque(:,i) = plant.theta_i(2:10001,(2*i)-1);%c(i).measuredTorque(1:end);
    
     % SPECIFY INPUTS
     PertSig(i,:) = measTorque(1:end,i)'-mean(measTorque(1:end,i)); % whichever type of torque input you're using
     posResponse(i,:) = (posFeedback(1:end,i))';

     % FREQUENCY DOMAIN
    InputFFT(i,:) = fft(PertSig(i,:)');            % FFT of Target
    OutputFFT(i,:) = fft(posResponse(i,:)');         % FFT of Position Response

    % FREQUENCY RANGE
    N = length(InputFFT(i,:));
    freq = (1:N/2)/(N/2)*(SamplingFreq/2);          % Frequencies that will be used for analysis
    freqRangeEnd = (N/1000)*EndFreq;                % Conversion to Indexes
    freqRangeStart = (N/1000)*StartFreq;            % Conversion to Indexes

    % ONE METHOD OF CALCULATING TRANSFER FUNCTION (NOT USED HERE)
    Gx(i,:) = InputFFT(i,1:N/2).*conj(InputFFT(i,1:N/2));
    Gy(i,:) = OutputFFT(i,1:N/2).*conj(OutputFFT(i,1:N/2));
    Gxy(i,:) = OutputFFT(i,1:N/2).*conj(InputFFT(i,1:N/2));
    
end

% 
avgGx = mean(Gx);
avgGy = mean(Gy);
avgGxy = mean(Gxy);
avgGx(1) = [];
avgGy(1) = [];
avgGxy(1) = [];

% SUBTRACTION ANALYSIS (I have a description of how and why this works if
% you want)
v = 1;
output = OutputFFT;
input = InputFFT;
for q = 1:(trials)-1
    for r = q+1:trials
        
        YTF(v,:) = (output(q,StartFreq*timeDur:timeDur*EndFreq))-(output(r,StartFreq*timeDur:timeDur*EndFreq));
        XTF(v,:) = (input(q,StartFreq*timeDur:timeDur*EndFreq))-(input(r,StartFreq*timeDur:timeDur*EndFreq));
%         YTF(v,:) = (output(q,StartFreq*timeDur:timeDur*EndFreq));
%         XTF(v,:) = (input(q,StartFreq*timeDur:timeDur*EndFreq));
        HPert(v,:) = (YTF(v,:))./(XTF(v,:));
        
        v = v+1;

    end
end

XPertdata = abs(mean(XTF,1)); % position input
YPertdata = (20*log10(abs(mean(HPert(1:end,:),1))));    % transfer function (FRF)

f=(StartFreq:1/timeDur:EndFreq); % frequencies used

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Curvefitting 1 - Estimation of J, B and K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bootstrapping Analysis with Iterations = 10000
[m n] = size(YPertdata);

% INITIAL CONDITIONS
% Gainrand = .5*2.^(rand(1,NIterations)*2-1);
% Jrand = 0.01.*1.^(rand(1,NIterations)*2-1); % inertia
% Brand = .001.*1.^(rand(1,NIterations)*2-1);    % viscosity
% Krand = .001.*1.^(rand(1,NIterations)*2-1);    % stiffness
Gainrand = 4.*(rand(1,NIterations)+1);
Jrand = 100*(rand(1,NIterations)+100); % inertia
Brand = 100.*(rand(1,NIterations)+100);    % viscosity
Krand = 50000.*(rand(1,NIterations)+50000);    % stiffness
Model = zeros(NIterations,400);
end_sig = (timeDur-2)*EndFreq-10; 

for j = 1:NIterations
    
    % CREATES INDEX FOR RESAMPLING
    range = log10(end_sig)-log10(1);
    offset = log10(1);
    randnos = rand(1,n)*range+offset;
    
    % Can use exponential or linear resampling - linear gives equal weight
    % to all frequencies, but FRFs are generally plotted on a log-log
    % scale, so this has the effect of over-weighting high frequencies.
    % Exponential resampling takes the log-log scale into account. Either
    % works, if you have significant low-frequency noise (drift or resonance),
    % go with linear, if there is significant high-frequency noise, use
    % exponential.
    
    Index = (sort(ceil(10.^randnos)));  % Resampling by decade - weights lower frequencies more heavily
    %Index = sort(ceil(rand(1,n).*n));  % Linear resampling - weights higher frequencies more heavily
    
    % RESAMPLING DATA
    Resampledf = f(Index);
    ResampledXData = XPertdata(1,Index);      % Resampling Xdata
    ResampledYData = ((YPertdata(1,Index)));      % Resampling Ydata
    GainInitial(j) = Gainrand(j);
    JInitial(j) =  Jrand(j);
    BInitial(j) =  Brand(j);
    KInitial(j) =  Krand(j);

    % CURVE FIT PARAMETERS
    options = optimset('MaxIter',4000,'MaxFunEvals',3000,'TolX',1e-20); % Sets maximum number of iterations, evaluations, and minimum tolerance to exit fit
    p1 = [ JInitial(j) BInitial(j) KInitial(j) GainInitial(j)];  % Initial conditions
     X = [(ResampledXData);(ResampledYData)];
    low = [0 0 0 0]; % lower bound on fit (can't be negative)
    high = [Inf Inf Inf 1]; % upper bound on fit (none currently, but can be set to whatever you want.)
   
    % CURVE FIT
    [p,fval,exitflag] = fminsearchbnd(@(p1) FRFFitLSQWristDynamics(p1,X),p1,low, high,options);
    
    % OUTPUT OF CURVE FIT
    J(j) = abs(p(1));
    B(j) = abs(p(2));
    K(j) = abs(p(3));
    Gain(j) = p(4);
    ExitFlag(j) = exitflag;
    
    % CALCULATING FITTED PLANT MODEL AND MAKING SURE FIT IS GOOD
    Resampledf = f;
    s = 2*pi*f*1j;
    plant = 1./(J(j)*s.^2+B(j)*s+K(j));
    model(j,:) = 20*log10(abs(plant));
    corrCoeff(j) = max(xcorr(model(j,:),YPertdata,'coeff'));
    
    % This was for me; when I'm running lots of fits I like to know how far
    % it's gone. This just prints out a value every thousand fits so I know
    % how much is left. You can comment it out.
    if round(i/1000)==i/1000
        figure(1),semilogx(Resampledf,model(j,:),f,YPertdata);
        i
    end
end

% CHECKS TO MAKE SURE FITS ARE GOOD
j=1;
k=1;
for i=1:NIterations
    
    % ACCEPTED CONDITIONS
    % exitflag == 1 means fit converged to a set of values
    % I like to amke sure the total system of arm+robot is not smaller than
    % just the robot. You can remove this if you like.
    % Another possible condition would be based on the goodness of fit
    % calculated above (corrCoeff).
%     if (ExitFlag(i)==1 && J(i)>0.006 && B(i)>.1 && K(i)>.1)     % Acceptance Criteria
        JAcc(j) = J(i);
        BAcc(j) = B(i);
        KAcc(j) = K(i);
        FlagAcc(j) = ExitFlag(i);
        IndexAcc(j) = i;
        ModelAcc(j,:) = Model(i,:);
        j=j+1;
%     else % Reject all other trials
%         JRej(k) = J(i);
%         BRej(k) = B(i);
%         KRej(k) = K(i);
%         FlagRej(k) = ExitFlag(i);
%         IndexRej(k) = i;
%         k=k+1;
%     end
end

% PLOT AND DISPLAY BOOTSTRAPPED FITS
figure,hist(JAcc,100)
figure,hist(BAcc,100)
figure,hist(KAcc,100)

MeanJ = mean(JAcc)
StdJ = std(JAcc)
MeanB = mean(BAcc)
StdB = std(BAcc)
MeanK = mean(KAcc)
StdK = std(KAcc)

% SAVE FILE (BUT ONLY IF THERE IS A LARGE NUMBER OF FITS)
if NIterations>=1000
 save('ResultsBS_JBK_final','JAcc','BAcc','KAcc');%,'JRej','BRej','KRej');
end

% This is for me, it beeps when it's done so I don'thave to continuously
% watch it. You can comment it out.
x = sin(440/2/pi*[1:10000]);
sound(x)

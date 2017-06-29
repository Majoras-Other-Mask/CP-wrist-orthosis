%% Autoregression Model Creation
%% 12/18/14

x=input('Enter Input Matrix: ');

net=narnet(1:5,1);

in=num2cell(x,1);

[a,b,c,d]=preparets(net,{},{},in);

net=train(a,d,b,c,'useParallel','yes')


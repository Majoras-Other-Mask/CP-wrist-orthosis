function y = pdo_start(init)

%puts the CAN device into operational mode
init(1).port=1;
init(1).type='Standard';
init(1).identifier=0;
init(1).data=[hex2dec('01'),0];
init(1).pause=.005;

y=init;
end

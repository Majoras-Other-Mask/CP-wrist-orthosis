function z = pdo_stop(term)

%puts the CAN device back into preoperational mode
term(1).port=1;
term(1).type='Standard';
term(1).identifier=0;
term(1).data=[hex2dec('80'),0];
term(1).pause=.005;

z=term;
end
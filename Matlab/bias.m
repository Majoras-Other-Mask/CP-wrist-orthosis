% Automated Zeroing for Force Sensors
% Devon Holley
% Created 10/6/14

%%
%UPDATE SECTION TO USE SDI Variables
ftop=top(1000:end);
fbottom=bot(1000:end);

%for updated output matrix
%ftop = output(1000:end,2); 
%fbottom = bot(1000:end,24); 

%%
caltop=mean(ftop);
calbottom=mean(fbottom);

accept=questdlg(sprintf('Offset of %f and %f detected. Proceed with bias?',caltop,calbottom),'Zero Calibration','Yes','No','Reset','Yes');
    
    switch accept
        case 'Yes'
            signal=[caltop calbottom];
            offset=offset+signal;
        case 'No'
            signal=offset;
        case 'Reset'
            signal=[0 0];
            offset=signal;
    end
%Force Sensor Automated Calibration Script (FCal)
%Devon Holley
%9/22/14

ftop=tg.OutputLog(200:end,15);
fbottom=tg.OutputLog(200:end,16);

caltop=mean(ftop);
calbottom=mean(fbottom);

disp(caltop)
disp(calbottom)

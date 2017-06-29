%%Superimposing Normalized P/S and F/E Profiles

t=input('Enter Array of Times: ');
d=input('Enter Data File: ');

    ps1 = d(t(1):t(2),6);
    ps2 = d(t(3):t(4),6);
    ps3 = d(t(5):t(6),6);
    ps4 = d(t(7):t(8),6);
    ps5 = d(t(9):t(10),6);
%     ps6 = d(t(11):t(12),6);
%     ps7 = d(t(13):t(14),6);
%     ps8 = d(t(15):t(16),6);
%     ps9 = d(t(17):t(18),6);
%     ps10 = d(t(19):t(20),6);
    
    fe1 = d(t(1):t(2),7);
    fe2 = d(t(3):t(4),7);
    fe3 = d(t(5):t(6),7);
    fe4 = d(t(7):t(8),7);
    fe5 = d(t(9):t(10),7);
%     fe6 = d(t(11):t(12),7);
%     fe7 = d(t(13):t(14),7);
%     fe8 = d(t(15):t(16),7);
%     fe9 = d(t(17):t(18),7);
%     fe10 = d(t(19):t(20),7);
   
x=0:1;
figure
plot(0:1/(length(ps1)-1):1,ps1,0:1/(length(ps2)-1):1,ps2,0:1/(length(ps3)-1):1,ps3,0:1/(length(ps4)-1):1,ps4,0:1/(length(ps5)-1):1,ps5)%,0:1/(length(ps6)-1):1,ps6,0:1/(length(ps7)-1):1,ps7,0:1/(length(ps8)-1):1,ps8,0:1/(length(ps9)-1):1,ps9,0:1/(length(ps10)-1):1,ps10)
figure
plot(0:1/(length(fe1)-1):1,fe1,0:1/(length(fe2)-1):1,fe2,0:1/(length(fe3)-1):1,fe3,0:1/(length(fe4)-1):1,fe4,0:1/(length(fe5)-1):1,fe5)%,0:1/(length(fe6)-1):1,fe6,0:1/(length(fe7)-1):1,fe7,0:1/(length(fe8)-1):1,fe8,0:1/(length(fe9)-1):1,fe9,0:1/(length(fe10)-1):1,fe10)

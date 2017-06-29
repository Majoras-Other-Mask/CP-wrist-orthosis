function [x,y,z,ps,fe] = normalize(t,d)

% t=input('Enter Array of Times: ');
% d=input('Enter Data File: ');

    x1 = d(t(1):t(2),1);
    normx1=transpose(0:1/(length(x1)-1):1);
    x2 = d(t(3):t(4),1);
    normx2=transpose(0:1/(length(x2)-1):1);
    x3 = d(t(5):t(6),1);
    normx3=transpose(0:1/(length(x3)-1):1);
    x4 = d(t(7):t(8),1);
    normx4=transpose(0:1/(length(x4)-1):1);
    x5 = d(t(9):t(10),1);
    normx5=transpose(0:1/(length(x5)-1):1);
    x6 = d(t(11):t(12),1);
    normx6=transpose(0:1/(length(x6)-1):1);
    x7 = d(t(13):t(14),1);
    normx7=transpose(0:1/(length(x7)-1):1);
    x8 = d(t(15):t(16),1);
    normx8=transpose(0:1/(length(x8)-1):1);
    x9 = d(t(17):t(18),1);
    normx9=transpose(0:1/(length(x9)-1):1);
    x10 = d(t(19):t(20),1);
    normx10=transpose(0:1/(length(x10)-1):1);
    
    y1 = d(t(1):t(2),2);
    normy1=transpose(0:1/(length(y1)-1):1);
    y2 = d(t(3):t(4),2);
    normy2=transpose(0:1/(length(y2)-1):1);
    y3 = d(t(5):t(6),2);
    normy3=transpose(0:1/(length(y3)-1):1);
    y4 = d(t(7):t(8),2);
    normy4=transpose(0:1/(length(y4)-1):1);
    y5 = d(t(9):t(10),2);
    normy5=transpose(0:1/(length(y5)-1):1);
    y6 = d(t(11):t(12),2);
    normy6=transpose(0:1/(length(y6)-1):1);
    y7 = d(t(13):t(14),2);
    normy7=transpose(0:1/(length(y7)-1):1);
    y8 = d(t(15):t(16),2);
    normy8=transpose(0:1/(length(y8)-1):1);
    y9 = d(t(17):t(18),2);
    normy9=transpose(0:1/(length(y9)-1):1);
    y10 = d(t(19):t(20),2);
    normy10=transpose(0:1/(length(y10)-1):1);
    
    z1 = d(t(1):t(2),3);
    normz1=transpose(0:1/(length(z1)-1):1);
    z2 = d(t(3):t(4),3);
    normz2=transpose(0:1/(length(z2)-1):1);
    z3 = d(t(5):t(6),3);
    normz3=transpose(0:1/(length(z3)-1):1);
    z4 = d(t(7):t(8),3);
    normz4=transpose(0:1/(length(z4)-1):1);
    z5 = d(t(9):t(10),3);
    normz5=transpose(0:1/(length(z5)-1):1);
    z6 = d(t(11):t(12),3);
    normz6=transpose(0:1/(length(z6)-1):1);
    z7 = d(t(13):t(14),3);
    normz7=transpose(0:1/(length(z7)-1):1);
    z8 = d(t(15):t(16),3);
    normz8=transpose(0:1/(length(z8)-1):1);
    z9 = d(t(17):t(18),3);
    normz9=transpose(0:1/(length(z9)-1):1);
    z10 = d(t(19):t(20),3);
    normz10=transpose(0:1/(length(z10)-1):1);

    ps1 = d(t(1):t(2),4);
    normps1=transpose(0:1/(length(ps1)-1):1);
    ps2 = d(t(3):t(4),4);
    normps2=transpose(0:1/(length(ps2)-1):1);
    ps3 = d(t(5):t(6),4);
    normps3=transpose(0:1/(length(ps3)-1):1);
    ps4 = d(t(7):t(8),4);
    normps4=transpose(0:1/(length(ps4)-1):1);
    ps5 = d(t(9):t(10),4);
    normps5=transpose(0:1/(length(ps5)-1):1);
    ps6 = d(t(11):t(12),4);
    normps6=transpose(0:1/(length(ps6)-1):1);
    ps7 = d(t(13):t(14),4);
    normps7=transpose(0:1/(length(ps7)-1):1);
    ps8 = d(t(15):t(16),4);
    normps8=transpose(0:1/(length(ps8)-1):1);
    ps9 = d(t(17):t(18),4);
    normps9=transpose(0:1/(length(ps9)-1):1);
    ps10 = d(t(19):t(20),4);
    normps10=transpose(0:1/(length(ps10)-1):1);
    
    fe1 = d(t(1):t(2),5);
    normfe1=transpose(0:1/(length(fe1)-1):1);
    fe2 = d(t(3):t(4),5);
    normfe2=transpose(0:1/(length(fe2)-1):1);
    fe3 = d(t(5):t(6),5);
    normfe3=transpose(0:1/(length(fe3)-1):1);
    fe4 = d(t(7):t(8),5);
    normfe4=transpose(0:1/(length(fe4)-1):1);
    fe5 = d(t(9):t(10),5);
    normfe5=transpose(0:1/(length(fe5)-1):1);
    fe6 = d(t(11):t(12),5);
    normfe6=transpose(0:1/(length(fe6)-1):1);
    fe7 = d(t(13):t(14),5);
    normfe7=transpose(0:1/(length(fe7)-1):1);
    fe8 = d(t(15):t(16),5);
    normfe8=transpose(0:1/(length(fe8)-1):1);
    fe9 = d(t(17):t(18),5);
    normfe9=transpose(0:1/(length(fe9)-1):1);
    fe10 = d(t(19):t(20),5);
    normfe10=transpose(0:1/(length(fe10)-1):1);
    
    
    
%     run1=[normx1 x1 normy1 y1 normz1 z1];
%     run2=[normx2 x2 normy2 y2 normz2 z2];
%     run3=[normx3 x3 normy3 y3 normz3 z3];
%     run4=[normx4 x4 normy4 y4 normz4 z4];
%     run5=[normx5 x5 normy5 y5 normz5 z5];
%     run6=[normx6 x6 normy6 y6 normz6 z6];
%     run7=[normx7 x7 normy7 y7 normz7 z7];
%     run8=[normx8 x8 normy8 y8 normz8 z8];
%     run9=[normx9 x9 normy9 y9 normz9 z9];
%     run10=[normx10 x10 normy10 y10 normz10 z10];
    
    
    
    for i=1:1000;
        n=i*.001;
        x(i,:)=transpose([x1(round(n*length(x1))) x2(round(n*length(x2))) x3(round(n*length(x3))) x4(round(n*length(x4))) x5(round(n*length(x5))) x6(round(n*length(x6))) x7(round(n*length(x7))) x8(round(n*length(x8))) x9(round(n*length(x9))) x10(round(n*length(x10)))]);
        y(i,:)=transpose([y1(round(n*length(y1))) y2(round(n*length(y2))) y3(round(n*length(y3))) y4(round(n*length(y4))) y5(round(n*length(y5))) y6(round(n*length(y6))) y7(round(n*length(y7))) y8(round(n*length(y8))) y9(round(n*length(y9))) y10(round(n*length(y10)))]);
        z(i,:)=transpose([z1(round(n*length(z1))) z2(round(n*length(z2))) z3(round(n*length(z3))) z4(round(n*length(z4))) z5(round(n*length(z5))) z6(round(n*length(z6))) z7(round(n*length(z7))) z8(round(n*length(z8))) z9(round(n*length(z9))) z10(round(n*length(z10)))]);
        ps(i,:)=transpose([ps1(round(n*length(ps1))) ps2(round(n*length(ps2))) ps3(round(n*length(ps3))) ps4(round(n*length(ps4))) ps5(round(n*length(ps5))) ps6(round(n*length(ps6))) ps7(round(n*length(ps7))) ps8(round(n*length(ps8))) ps9(round(n*length(ps9))) ps10(round(n*length(ps10)))]);
        fe(i,:)=transpose([fe1(round(n*length(fe1))) fe2(round(n*length(fe2))) fe3(round(n*length(fe3))) fe4(round(n*length(fe4))) fe5(round(n*length(fe5))) fe6(round(n*length(fe6))) fe7(round(n*length(fe7))) fe8(round(n*length(fe8))) fe9(round(n*length(fe9))) fe10(round(n*length(fe10)))]);
    end
    
     
    
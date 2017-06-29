function [rho,theta] = fcn(pos,vel,r1,t1,r2,t2)
%#codegen
segout=9;
n=1;
for i=6450:88431
segin=segout;    
p=pos(:,i)./10;
v=vel(i);

%TRILINEAR INTERPOLATION
    %set upper and lower map points
    up=ceil(p);
    low=floor(p);
    %determine distance from current point to lower map point
    d=p-low;
    %interpolation stage 1
    rho001=(r1(low(1),low(2),low(3))*(1-d(1)))+(r1(up(1),low(2),low(3))*d(1));
    theta001=(t1(low(1),low(2),low(3))*(1-d(1)))+(t1(up(1),low(2),low(3))*d(1));
    rho101=(r1(low(1),up(2),low(3))*(1-d(1)))+(r1(up(1),up(2),low(3))*d(1));
    theta101=(t1(low(1),up(2),low(3))*(1-d(1)))+(t1(up(1),up(2),low(3))*d(1));
    rho011=(r1(low(1),low(2),up(3))*(1-d(1)))+(r1(up(1),low(2),up(3))*d(1));
    theta011=(t1(low(1),low(2),up(3))*(1-d(1)))+(t1(up(1),low(2),up(3))*d(1));
    rho111=(r1(low(1),up(2),up(3))*(1-d(1)))+(r1(up(1),up(2),up(3))*d(1));
    theta111=(t1(low(1),up(2),up(3))*(1-d(1)))+(t1(up(1),up(2),up(3))*d(1));
    %interpolation stage 2
    rho01=(rho001*(1-d(2)))+(rho101*d(2));
    theta01=(theta001*(1-d(2)))+(theta101*d(2));
    rho11=(rho011*(1-d(2)))+(rho111*d(2));
    theta11=(theta011*(1-d(2)))+(theta111*d(2));
    %interpolation stage 3
    rho1=(rho01*(1-d(3)))+(rho11*d(3));
    theta1=(theta01*(1-d(3)))+(theta11*d(3));
    
    rho002=(r2(low(1),low(2),low(3))*(1-d(1)))+(r2(up(1),low(2),low(3))*d(1));
    theta002=(t2(low(1),low(2),low(3))*(1-d(1)))+(t2(up(1),low(2),low(3))*d(1));
    rho102=(r2(low(1),up(2),low(3))*(1-d(1)))+(r2(up(1),up(2),low(3))*d(1));
    theta102=(t2(low(1),up(2),low(3))*(1-d(1)))+(t2(up(1),up(2),low(3))*d(1));
    rho012=(r2(low(1),low(2),up(3))*(1-d(1)))+(r2(up(1),low(2),up(3))*d(1));
    theta012=(t2(low(1),low(2),up(3))*(1-d(1)))+(t2(up(1),low(2),up(3))*d(1));
    rho112=(r2(low(1),up(2),up(3))*(1-d(1)))+(r2(up(1),up(2),up(3))*d(1));
    theta112=(t2(low(1),up(2),up(3))*(1-d(1)))+(t2(up(1),up(2),up(3))*d(1));
    rho02=(rho002*(1-d(2)))+(rho102*d(2));
    theta02=(theta002*(1-d(2)))+(theta102*d(2));
    rho12=(rho012*(1-d(2)))+(rho112*d(2));
    theta12=(theta012*(1-d(2)))+(theta112*d(2));
    rho2=(rho02*(1-d(3)))+(rho12*d(3));
    theta2=(theta02*(1-d(3)))+(theta12*d(3));
    
    if segin == 1
        if p(1) <= 45 && p(2) >= 35
            if abs(v) < 1e-2 %&& abs(v(2)) <= 5
                segout=3;
                n=1;
%                 rho=.25*rho1+.75*rho2;
%                 theta=.25*theta1+.75*theta2;
            else 
                segout=1;
%                 rho=.25*rho1+.75*rho2;
%                 theta=.25*theta1+.75*theta2;
            end
        else
            segout=1;
%             rho=rho1;
%             theta=theta1;
        end
        rho=rho1;
        theta=theta1;
        
    elseif segin == 2
        if p(1) <= 45 && p(2) >= 35
            segout=2;
%             rho=.8*rho1+.2*rho2;
%             theta=.8*theta1+.2*theta2;
        elseif p(1) <= 34
            segout=4;
            n=1;
%             rho=.75*rho2+.25*rho1;
%             theta=.75*theta2+.25*theta1;
%         elseif p(1) <= 45 && p(2) >= 35
%             if abs(v(1)) <= 5 && abs(v(2)) <= 5
%                 segout=3;
% %                 rho=.25*rho2+.75*rho3;
% %                 theta=.25*theta2+.75*theta3;
%             else
%                 segout=2;
% %                 rho=.25*rho2+.75*rho3;
% %                 theta=.25*theta2+.75*theta3;
%             end
        else
            segout=2;
            
%             rho=rho2;
%             theta=theta2;
        end
        rho=rho2;
        theta=theta2;
        
    elseif segin == 3
        if n > 100
            segout=2;
            rho=rho2;
            theta=theta2;
        else
            segout=3;
            rho=(n*.01*rho2)+((1-(n*.01))*rho1);
            theta=(n*.01*theta2)+((1-(n*.01))*theta1);
            n=n+1;
        end
        
    elseif segin ==4
        if n > 100
            segout=9;
            rho=0;
            theta=0;
        else
            segout=4;
            rho=((1-(n*.01))*rho2);
            theta=((1-(n*.01))*theta2);
            n=n+1;
        end
        
    elseif segin ==5
        if n > 100
            segout=1;
            rho=rho1;
            theta=rho1;
        else
            segout=5;
            rho=n*.01*rho1;
            theta=n*.01*theta1;
            n=n+1;
        end
        
        else 
        rho=0;
        theta=0;
        segout=segin;
        if p(1) >= 34 %&& p(2) <= 22
            segout=5;
            n=1;
        else
        end    
    end
end
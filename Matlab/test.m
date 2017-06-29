if segin == 5
    n=1
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
    
    rho=rho1;
    theta=theta1;
    
    segin=6
elseif segin == 6
    rho=((1-.1*n)*rho1)+(.1*n*rho2)
    theta=((1-.1*n)*theta1)+(.1*n*theta2)
    n=n+1
    if n <= 10
        segin=6
    else
        segin=7;
    end
end

    
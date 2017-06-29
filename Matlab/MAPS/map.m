x=tg.OutputLog(:,26)./10;
y=tg.OutputLog(:,27)./10;
z=round((tg.OutputLog(:,28)./10));
start=9000;
finish=13000;

for n=start:100:10600
    figure(25)
    surf(rho1(:,:,z(n)))
    shading interp
    colorbar
    view(0,90)
    caxis([-1.6,0])
    title(num2str(n,z(n)))
    xlabel(num2str(z(n)))
    hold on
    plot(y(n),x(n),'w*')
    hold off
    pause
end

for n=10700:100:finish
    figure(25)
    surf(rho2(:,:,z(n)))
    shading interp
    colorbar
    view(0,90)
    caxis([-1.6,0])
    title(num2str(n))
    xlabel(num2str(z(n)))
    hold on
    plot(y(n),x(n),'w*')
    hold off
    pause
end

% for n=1:30
%     figure(25)
%     surf(rho_forward(:,:,n))
%     shading interp
%     colorbar 
%     view(0,90)
%    %caxis([-1.6,0])
%     title(num2str(n))
% %     pause
%     
%     figure(26)
%     surf(rho_bck(:,:,n))
%     shading interp
%     colorbar
%     view(0,90)
%   % caxis([-1.6,0])
%     title(num2str(n))
%     pause
% end
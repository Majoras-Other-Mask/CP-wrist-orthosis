function Response = FRFFitLSQWristDynamics(p,X)

global StartFreq
global EndFreq
global timeDur
global Resampledf

J = p(1); % inertia
B = (p(2));  % viscosity
K = p(3);    % stiffness
Gain = p(4);   % numerator of plant. generally left at 1.

Y1 = X(2,:);
X1 = (X(1,:));

f = Resampledf;
s = 2*pi*f*1j;

% calculates estimate of position (output)
Y_fun = (Gain.*X1./(J.*s.^2+B*s+K)); 

Fx = X1.*conj(X1);
Fxy = Y_fun.*conj(X1);

% Calculates sum squared error (estimated transfer function vs. actual
% transfer function). This is the varialbe minimized by fminsearchbnd.
Response =sum((20.*log10(abs(Y_fun./X1))-Y1).^2);
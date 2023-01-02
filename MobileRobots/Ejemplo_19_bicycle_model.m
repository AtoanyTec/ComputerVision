% Kinamatic bicycle
% Atoany Fierro

%% 
clc
clear all
close all

%% Scenario 

% Car
L = 2.7;                        % Wheelbase                     [m]
a = 0.935;                      % Front overhang                [m]
b = L;                        % Dist. CG - front axle         [m]
c = L/2;                        % Dist. CG - rear axle          [m]
d = 0.995;                      % Rear overhang                 [m]
w = 1.780;                      % Width                         [m]

% Initial conditions 
x0      = 0;                    % Initial x rear axle           [m]
y0      = 0;                    % Initial y rear axle           [m]
psi0    = 0;                    % Initial yaw angle             [rad]
delta0  = 0;                    % Initial steering angle        [rad]
z0 = [x0 x0 psi0 delta0];

% Parameters
tf      = 30;                   % Final time                    [s]
fR      = 30;                   % Frame rate                    [fps]
dt      = 1/fR;                 % Time resolution               [s]
time    = linspace(0,tf,tf*fR); % Time                          [s]


%% Simulation   
options = odeset('RelTol',1e-5);
[tout,zout] = ode45(@(t,z) car(t,z,L),time,z0,options);

% Retrieving states
x = zout(:,1);                  % Rear axle x position          [m]
y = zout(:,2);                  % Rear axle y position          [m]
g = zout(:,3);                  % Yaw angle                     [rad]

% Yaw rate and speed
% Preallocating
dg  = zeros(length(time),1);
v   = zeros(length(time),1);
for i=1:length(time)
    [dz,vel]    = car(time(i),zout(i,:),L);
    dg(i)       = dz(3);
    v(i)        = vel;
end

% States for animation
XT      = x + c*cos(g);         % CG X location                 [m]
YT      = y + c*sin(g);         % CG Y location                 [m]
PSI     = zout(:,3);            % Yaw angle                     [rad]
dPSI    = dg;                   % Yaw rate                      [rad/s]
VEL     = v;                    % Vehicle speed                 [m/s]
ALPHAT  = atan(dg*c/v);         % Vehicle side slip angle       [rad]


%% Animation

% Struct for animation
data.XT        = XT;
data.YT        = YT;
data.PSI       = PSI;
data.dPSI      = dPSI;
data.VEL       = VEL;
data.ALPHAT    = ALPHAT;
data.TSpan     = time;
data.a         = a;
data.b         = b;
data.c         = c;
data.d         = d;
data.wT        = w;

animation(data);



function [dz,v] = car(t,z,L)

    % States
    g = z(3);
    delta = z(4);               % Steering angle                [rad] 

    v = 15/3.6;                 % Speed of rear axle            [m/s]
    
    % STEERING
    % Straight line
        t1 = 2;                 % Straight line duration        [s]
        deltaRate = 0;

    % Steering change 1
        steerChangeDuration_1 = 1; % [s]
        if t > t1 && t < t1 + steerChangeDuration_1
            deltaRate = 15*pi/180;
        end

    % Steering change 2
        t2 = 12;
        steerChangeDuration_2 = 2; % [s]
        if t > t2 && t < t2 + steerChangeDuration_2
            deltaRate = -15*pi/180;
        end
        
    % Steering change 3
        t3 = 23;
        steerChangeDuration_3 = 1; % [s]
        if t > t3 && t < t3 + steerChangeDuration_3
            deltaRate = 15*pi/180;
        end
    
    % Kinematic bicycle model
    dx = v*cos(g);
    dy = v*sin(g);
    dg = v/L*tan(delta);
    dd = deltaRate; 

    dz = [dx ; dy ; dg ; dd];
    
end
function animation(data)

    % Color
    color_Front_Axle    = 'b';
    color_Rear_Axle     = 'g';
    color_Car           = 'r';

    % Retrieving data
    TOUT    = data.TSpan;
    XT      = data.XT;              % CG x position             [m]
    YT      = data.YT;              % CG y position             [m]
    PSI     = data.PSI;             % Vehicle yaw angle         [rad]
    VEL     = data.VEL;             % Vehicle CG velocity       [m/s]
    ALPHAT  = data.ALPHAT;          % Vehicle side slip angle   [rad]
    dPSI    = data.dPSI;            % Yaw rate                  [rad/s]
    a       = data.a;               % Front overhang            [m]
    b       = data.b;               % Distance FT               [m]
    c       = data.c;               % Distance TR               [m]
    d       = data.d;               % Rear overhang             [m]
    lT      = data.wT / 2;          % Half width of the vehicle [m]

    % Slip angle @ front axle [rad]
    ALPHAF = atan2((b * dPSI + VEL.*sin(ALPHAT)),(VEL.*cos(ALPHAT)));
    % OBS: No steering angle because it measures the angle between velocity
    % vector and longitudinal axle of the vehicle.
    
    %Slip angle @ rear axle [rad]
    ALPHAR = atan2((-c * dPSI + VEL.*sin(ALPHAT)),(VEL.*cos(ALPHAT)));

    % Speed @ front axle [m/s]
    VF = sqrt((VEL.*cos(ALPHAT)).^2 + (b * dPSI + VEL.*sin(ALPHAT)).^2);
    % Speed @ rear axle [m/s]
    VR = sqrt((VEL.*cos(ALPHAT)).^2 + (-c * dPSI + VEL.*sin(ALPHAT)).^2);

    % Position of the corners and axles relative to CG
    % Position vectors 1, 2, 3 e 4 relative to T base (T t1 t2 t3)
    rt1t = [a+b;lT];                    % Front left
    rt2t = [a+b;-lT];                   % Front right
    rt3t = [-c-d;-lT];                  % Rear right
    rt4t = [-c-d;lT];                   % Rear left

    eif = [b;0];                        % Front axle
    eir = [-c;0];                       % Rear axle

    % Absolute position of corners and axles
    % Movement of the points from change of orientation.

    % Preallocating matrix
    rt1i = zeros(length(TOUT),2);
    rt2i = zeros(length(TOUT),2);
    rt3i = zeros(length(TOUT),2);
    rt4i = zeros(length(TOUT),2);

    eff = zeros(length(TOUT),2);
    err = zeros(length(TOUT),2);

    % Loop start
    for j=1:length(TOUT)
        % Rotation matrix base (T t1 t2 t3) to (o i j k)
        RTI=[cos(PSI(j)) -sin(PSI(j));sin(PSI(j)) cos(PSI(j))];
        % Position vectors 1, 2, 3 e 4 relative to origin of the inertial
        % reference base (T t1 t2 t3)
        rt1i(j, 1:2) = (RTI * rt1t)';
        rt2i(j, 1:2) = (RTI * rt2t)';
        rt3i(j, 1:2) = (RTI * rt3t)';
        rt4i(j, 1:2) = (RTI * rt4t)';
        % Position of front and rear axle
        eff(j, 1:2) = (RTI * eif);     % Front
        err(j, 1:2) = (RTI * eir);     % Rear
    end

    % Absolute position of corners and axles
    % Position vectors 1, 2, 3 e 4 relative to o base (o i j k)
    rc1t=[XT YT]+rt1i;
    rc2t=[XT YT]+rt2i;
    rc3t=[XT YT]+rt3i;
    rc4t=[XT YT]+rt4i;
    % Absolute position of the front and rear axle
    ef = [XT YT]+eff;
    er = [XT YT]+err;

    figure
    % set(gcf,'Position',[50 50 1280 720]) % YouTube: 720p
    % set(gcf,'Position',[50 50 854 480]) % YouTube: 480p
    set(gcf,'Position',[50 50 640 640]) % Social
    
    % Create and open video writer object
    v = VideoWriter('Kinematic_bicycle_open.mp4','MPEG-4');
    v.Quality = 100;
    open(v);
    
    hold on ; grid on ; axis equal
    set(gca,'xlim',[min(XT)-5 max(XT)+5],'ylim',[min(YT)-5 max(YT)+5])
    xlabel('x distance [m]');
    ylabel('y distance [m]');

    for j = 1:length(TOUT)
        
        cla
        
        % Axles
        plot(ef(:,1),ef(:,2),color_Front_Axle)
        plot(er(:,1),er(:,2),color_Rear_Axle)

        % Coordinates of the corners
        xc = [rc1t(j, 1) rc2t(j, 1) rc3t(j, 1) rc4t(j, 1)];
        yc = [rc1t(j, 2) rc2t(j, 2) rc3t(j, 2) rc4t(j, 2)];

        % Vehicle
        fill(xc, yc,color_Car)

        % Velocity vectors
        % Different colors
        vector(ef(j, 1:2),(ALPHAF(j)+PSI(j)),VF(j),color_Front_Axle);
        vector(er(j, 1:2),(ALPHAR(j)+PSI(j)),VR(j),color_Rear_Axle);

        title(strcat('Time=',num2str(TOUT(j),"%.2f"),' s'))

        frame = getframe(gcf);
        writeVideo(v,frame);

    end

    close(v);
    
end
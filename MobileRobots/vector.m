function vector(startCoord, angle, modulus, color)

    coord1  = startCoord;                                   % Vector start coordinate
    theta   = angle;
    modulus = 0.7 * modulus;                                % Size of the vector
    coord2  = modulus*[cos(theta) sin(theta)] + coord1;     % Vector end coordinate

    %theta = atan2((coord1(1)-coord2(1)),(coord1(2)-coord2(2))); % Orientatin angle of the triangle
    esc     = 1;    % Scale
    l       = 0.5;  % width relative to the triangle length (0-1)

    % Shape and orientation of the triangle
    c1 = esc * l*[-sin(theta) +cos(theta)];     % corner 1 - bottom left
    c2 = esc * l*[+sin(theta) -cos(theta)];     % corner 2 - bottom right
    c3 = esc*[+cos(theta) +sin(theta)];         % corner 3 - top central

    % Scale and positioning
    x = [c1(1)+coord2(1) c2(1)+coord2(1) c3(1)+coord2(1)];
    y = [c1(2)+coord2(2) c2(2)+coord2(2) c3(2)+coord2(2)];

    hold on
    fill(x, y, color)
    p = plot([coord1(1) coord2(1)],[coord1(2) coord2(2)],color);
    set(p, 'LineWidth', 2)

    % Vector origin
    m = plot(coord1(1),coord1(2),strcat('*', color));
    set(m, 'MarkerSize', 10)
    
end
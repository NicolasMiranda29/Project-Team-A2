function plot_ppp(q, color)
    % Visualiza el robot PPP en configuración q
    T = ppp_fk(q);
    pos = T(1:3,4);

    clf; hold on; axis equal;
    set(gcf,'Color','k'); % fondo negro
    xlabel('X'); ylabel('Y'); zlabel('Z');
    view(3); grid on;

    % Ejes base
    plot3(0,0,0,'wo','MarkerSize',6,'LineWidth',2);
    % Trayectoria de cada eje
    plot3([0 q(2)], [0 0], [0 0], 'r', 'LineWidth', 2); % eje Y → X
    plot3([q(2) q(2)], [0 q(1)], [0 0], 'g', 'LineWidth', 2); % eje Z → Y
    plot3([q(2) q(2)], [q(1) q(1)], [0 q(3)], 'b', 'LineWidth', 2); % eje X → Z

    % End-effector
    plot3(pos(1), pos(2), pos(3), 'mo', 'MarkerSize', 8, 'LineWidth', 2);
end
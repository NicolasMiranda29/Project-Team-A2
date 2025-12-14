clc; clear; close all;

% ================================
% Puntos clave dentro del workspace reducido
% ================================
q_home   = [0.5 0.3 0.35];
q_pick   = [0.5 0.3 0.1];
q_lift   = [0.5 0.3 0.35];
q_move   = [0.9 0.6 0.35];
q_place  = [0.9 0.6 0.1];
q_return = [0.4 0.2 0.3];

% ================================
% Trayectoria interpolada (solo TCP)
% ================================
steps = 20;
traj = [...
    interp1([0 1],[q_home; q_pick],linspace(0,1,steps));
    interp1([0 1],[q_pick; q_lift],linspace(0,1,steps));
    interp1([0 1],[q_lift; q_move],linspace(0,1,steps));
    interp1([0 1],[q_move; q_place],linspace(0,1,steps));
    interp1([0 1],[q_place; q_return],linspace(0,1,steps))
];

% ================================
% Animación del movimiento
% ================================
figure;
grid on; hold on;
xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
title('Animación del movimiento del TCP');
axis([0 1 0 0.65 0 0.41]); % workspace reducido
view(135,30);

% Dibujar inicio y fin
plot3(traj(1,1), traj(1,2), traj(1,3), 'go','MarkerSize',8,'DisplayName','Inicio');
plot3(traj(end,1), traj(end,2), traj(end,3), 'bo','MarkerSize',8,'DisplayName','Fin');

% Animar paso a paso
for i = 1:size(traj,1)
    plot3(traj(i,1), traj(i,2), traj(i,3), 'r.-','MarkerSize',10);
    pause(0.1); % controla la velocidad de la animación
end

legend('Inicio','Fin','Trayectoria');
clc; clear; close all;

% Parámetros del espacio de trabajo
x_vals = linspace(0, 1, 10);     % Eje X
y_vals = linspace(0, 0.65, 6.5);     % Eje Y
z_vals = linspace(0, 0.41, 4.1);   % Eje Z

% Crear malla de puntos
[X, Y, Z] = meshgrid(x_vals, y_vals, z_vals);

% Convertir a vectores
Xv = X(:); Yv = Y(:); Zv = Z(:);

% Crear figura con fondo negro
figure('Color', 'k');  % fondo negro

% Graficar puntos en color amarillo
scatter3(Xv, Yv, Zv, 20, 'y', 'filled');

% Etiquetas y configuración
xlabel('X (m)', 'Color', 'w');
ylabel('Y (m)', 'Color', 'w');
zlabel('Z (m)', 'Color', 'w');
title('Espacio de trabajo del robot PPP (1 × 0.65 × 0.41 m)', 'Color', 'w');

% Ajustes visuales
axis equal;
axis([0 1 0 .65 0 .41]);
grid on;
set(gca, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'ZColor', 'w');  % fondo negro en el área del gráfico
view(100, 30);
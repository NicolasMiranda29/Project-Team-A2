function tau = ppp_dynamics(q, dq, ddq, m)
    % Modelo dinámico simplificado
    g = 9.81;
    M = diag(m); % matriz de inercia
    G = [m(1)*g; 0; 0]; % gravedad solo en eje vertical
    C = zeros(3,1); % sin Coriolis

    tau = M * ddq + C + G;
end
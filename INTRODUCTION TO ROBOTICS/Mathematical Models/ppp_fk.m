function T = ppp_fk(q)
    % Cinemática directa para robot PPP tipo grúa
    % q = [q1; q2; q3] → desplazamientos prismáticos

    x = q(2); % eje Y moviéndose en X
    y = q(1); % eje Z moviéndose en Y
    z = q(3); % eje X moviéndose en Z

    T = [eye(3), [x; y; z]; 0 0 0 1];
end
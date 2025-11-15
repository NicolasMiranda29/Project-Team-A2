function animate_pick_and_place()
    % Trayectoria simple de pick-and-place
    q_start = [0; 0; 0];
    q_pick = [0.3; 0.2; 0.1];
    q_place = [0.3; 0.6; 0.1];

    steps = 50;
    traj = [linspace(q_start(1), q_pick(1), steps);
            linspace(q_start(2), q_pick(2), steps);
            linspace(q_start(3), q_pick(3), steps)];

    for i = 1:steps
        plot_ppp(traj(:,i), 'c');
        pause(0.05);
    end

    traj2 = [linspace(q_pick(1), q_place(1), steps);
             linspace(q_pick(2), q_place(2), steps);
             linspace(q_pick(3), q_place(3), steps)];

    for i = 1:steps
        plot_ppp(traj2(:,i), 'y');
        pause(0.05);
    end
end
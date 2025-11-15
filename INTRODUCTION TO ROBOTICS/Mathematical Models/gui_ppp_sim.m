function gui_ppp_sim()
    f = figure('Name','Simulador Robot PPP','Color','k','Position',[100 100 800 600]);

    % Sliders para q1, q2, q3
    uicontrol(f,'Style','text','String','q1 (Y vertical)','Position',[20 550 100 20],'ForegroundColor','w','BackgroundColor','k');
    s1 = uicontrol(f,'Style','slider','Min',0,'Max',1,'Value',0.2,...
        'Position',[130 550 200 20],'Callback',@update_plot);

    uicontrol(f,'Style','text','String','q2 (X horizontal)','Position',[20 520 100 20],'ForegroundColor','w','BackgroundColor','k');
    s2 = uicontrol(f,'Style','slider','Min',0,'Max',1,'Value',0.5,...
        'Position',[130 520 200 20],'Callback',@update_plot);

    uicontrol(f,'Style','text','String','q3 (Z profundidad)','Position',[20 490 100 20],'ForegroundColor','w','BackgroundColor','k');
    s3 = uicontrol(f,'Style','slider','Min',0,'Max',1,'Value',0.3,...
        'Position',[130 490 200 20],'Callback',@update_plot);

    % Botón de animación
    uicontrol(f,'Style','pushbutton','String','Animar Pick & Place',...
        'Position',[600 550 150 30],'Callback',@(src,event) animate_pick_and_place());

    % Ejes de visualización
    ax = axes('Parent',f,'Position',[0.4 0.1 0.55 0.75]);
    set(ax,'Color','k');
    view(3); axis equal; grid on;
    xlabel('X'); ylabel('Y'); zlabel('Z');

    % Función de actualización
    function update_plot(~,~)
        q = [s1.Value; s2.Value; s3.Value];
        axes(ax);
        plot_ppp(q, 'c');
    end

    update_plot();
end
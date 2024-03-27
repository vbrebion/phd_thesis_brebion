% This script can be used to plot in 3D the events for the "fan" sequence.
% Note: tested only in MATLAB R2023a
% Note: for the created image to render correctly, you may have to run this
% script twice, without closing the figure window

% We begin by opening the file containing the events, and we read from it
events_file = fopen('events.txt', 'r');
events_fan = fscanf(events_file, '%d %d %f %d', [4 Inf]);
events_fan = events_fan';

% We set the timestamps so that they start at 0
events_fan(:, 3) = events_fan(:, 3) - events_fan(1, 3);

% We only keep the events up to t == 0.01
events_fan_filt = events_fan(events_fan(:, 3) <= 0.01, :);

% We scale the timestamps to be in ms
events_fan_filt(:, 3) = events_fan_filt(:, 3) * 1000;

% We set the color scale based on the timestamps
color_scale = events_fan_filt(:, 3);
color_scale(end) = 0;

% We plot the events
scatter3(events_fan_filt(:, 1), events_fan_filt(:, 3), events_fan_filt(:, 2), 2, color_scale, 'x');

% We configure the axis / the view to make the figure look as we want
ax = gca;
% We set the font to Palatino
set(ax, 'fontname', 'palatino');
% We set the axis labels
xlabel('x (px)');
ylabel('t (ms)');
zlabel('y (px)');
% We set the axis limits
axis([0 1280 0 10 0 720]);
% We set the ticks
set(ax, 'XTick', 0:320:1280);
set(ax, 'YTick', 0:10/6:10);
set(ax, 'ZTick', 0:360:720);
% We invert the "y" axis
set(ax, 'zdir', 'reverse');
% We move the "t" axis to the top left
ax.YRuler.FirstCrossoverValue = 0;
ax.YRuler.SecondCrossoverValue = 0;
% We set the aspect ration and view point
daspect([1 0.00075 1]);
view(5, 5);
% We add a bounding box for a better viz
set(ax, 'BoxStyle', 'full', 'Box', 'on');
% We set the background color
set(gcf, 'Color', [0.90 0.90 0.90]);

% We save the generated plot as an image or as vector graphics (choose the
% one you prefer)
set(gcf, 'Units', 'centimeters', 'OuterPosition', [0 0 15 30]);
%exportgraphics(gcf, 'plotted_events.png');
exportgraphics(gcf, 'plotted_events.pdf', 'ContentType', 'vector');

% We don't forget to close the file containing the events
fclose(events_file);

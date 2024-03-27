% This script can be used to plot in 3D the frames for the "fan" sequence.
% Note: tested only in MATLAB R2023a
% Note: for the created image to render correctly, you may have to run this
% script twice, without closing the figure window

% This script was inspired by:
% https://fr.mathworks.com/matlabcentral/answers/300826-how-do-i-insert-an-image-in-my-2-d-and-3-d-plots-in-matlab-8-2-r2013b#answer_232714

% We begin by loading the frames
img1 = imread('frames/frame1.png');
img2 = imread('frames/frame2.png');
img3 = imread('frames/frame3.png');
img4 = imread('frames/frame4.png');

% We set the x, y, and t coordinates for plotting the frames
xImage = [0 1280; 0 1280];
yImage = [0 0; 720 720];
tImage1 = [0 0; 0 0];
tImage2 = [10/3 10/3; 10/3 10/3];
tImage3 = [20/3 20/3; 20/3 20/3];
tImage4 = [10 10; 10 10];

% We plot the 4 frames
surf(xImage, tImage1, yImage, 'CData', img1, 'FaceColor','texturemap');
hold on;
surf(xImage, tImage2, yImage, 'CData', img2, 'FaceColor','texturemap');
surf(xImage, tImage3, yImage, 'CData', img3, 'FaceColor','texturemap');
surf(xImage, tImage4, yImage, 'CData', img4, 'FaceColor','texturemap');
hold off;


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

% We save the generated plot as an image or as vector graphics (choose the
% one you prefer)
set(gcf, 'Units', 'centimeters', 'OuterPosition', [0 0 15 30]);
%exportgraphics(gcf, 'plotted_frames.png');
exportgraphics(gcf, 'plotted_frames.pdf', 'ContentType', 'vector');

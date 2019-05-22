function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2))); % there are 400 pixels in width
  %example_width = 20 
end

% Gray Image
colormap(gray);

% Compute rows, cols
[m n] = size(X); % 5000 x 400 so n= 400
example_height = (n / example_width);
% 400/20 = 20 so height is 20 while width is 20

% Compute number of items to display
display_rows = floor(sqrt(m)); % round down square-root(5000) so there are 70 rows
display_cols = ceil(m / display_rows); % 5000/70 = 71 
% 70 x 71 array

% Between images padding
pad = 1;

% Setup blank display
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
curr_ex = 1;
for j = 1:display_rows % 1 to 70
	for i = 1:display_cols %1 to 71
		if curr_ex > m, % break if we out of traning data
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
		max_val = max(abs(X(curr_ex, :))); % max of X(everything on row curr_ex)
		display_array(pad + (j - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (i - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image
h = imagesc(display_array, [-1 1]);

% Do not show axis
axis image off

drawnow;

end

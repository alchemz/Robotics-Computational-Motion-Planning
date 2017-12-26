%main loop
while true

	% draw current map
	map(starnode)= 5;
	map(dest_node)=6;

	% make drawMapEveryTime = true to see how the nodes are expanded on the grid
	if(drawMapEveryTime)
		image(1.5, 1.5, map);
		grid on;
		axis image;
		drawnow;
	end

	%Find the node with the minimum distance
	[min_dist, current]= min(distanceFromStart(:));

	if((current==dest_node) || isinf(min_dist))
		break;
	end;

	%update map
	map(current)=3; %mark current map as visited
	distanceFromStart(current) = Inf; %remove this node from further consideration

	%compute row, column coordinates of current node
	[i, j] = ind2sub(size(distanceFromStart),current);

	%%visit each neighbour of the current node and update the map, distance, and parent tables appropriately

	ii=0;
	jj=0;
	if(i>1 && i<nrows)
		ii=i-1;
		jj=j;
		if(map(ii, jj)~=2 && map(ii, jj)~=3 && map(ii, jj)~=5)
			map(ii, jj) =4;
			parent(ii, jj)=current;
			distanceFromStart(ii, jj)= min_dist +1;
		end
	end
	if（i>=1 && i<nrows)
		ii =i+1;
		jj=j;
		if(map(ii, jj)~=2 && map(ii, jj)~=3 && map(ii, jj)~=5)
			map(ii, jj)=4;
			parent(ii, jj)=current;
			distanceFromStart(ii, jj)= min_dist+1;
		end
	end
	if(j >1 && j<cols)
		jj=j-1;
		ii=i;
		if(map(ii, jj)~=2 && map(ii, jj)~=3 && map(ii, jj)~=5)
			map(ii, jj) =4;
			parent(ii, jj)=current;
			distanceFromStart(ii, jj)= min_dist +1;
		end
	end
	if(j>=1 && j <ncols)
		jj= j+1;
		ii=i;
		if(map(ii, jj)~=2 && map(ii, jj)~=3 && map(ii, jj)~=5)
			map(ii, jj) =4;
			parent(ii, jj)=current;
			distanceFromStart(ii, jj)= min_dist +1;
		end
	end

numExpanded = numExpanded +1;

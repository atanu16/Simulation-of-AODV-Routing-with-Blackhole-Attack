% Number of nodes in the network
numNodes = 20;

% Communication range of nodes (in meters)
commRange = 100;

% Create random node positions within a square region
nodePositions = rand(numNodes, 2) * 1000;

% Compute Delaunay triangulation
DT = delaunayTriangulation(nodePositions);

% Extract row and column indices from the Delaunay triangulation connectivity list
[row, col] = find(tril(ones(size(DT.ConnectivityList, 1), size(DT.ConnectivityList, 2)), -1));

% Create a sparse adjacency matrix
adjacencyMatrix = sparse([DT.ConnectivityList(row,:); DT.ConnectivityList(col,:)], ...
                         [DT.ConnectivityList(col,:); DT.ConnectivityList(row,:)], ...
                         1, numNodes, numNodes);

% Ensure symmetric connectivity
adjacencyMatrix = double(adjacencyMatrix | adjacencyMatrix');

% Display connectivity graph
G = graph(adjacencyMatrix);
figure;
plot(G, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2), 'NodeLabel', {});

% Implement AODV routing protocol (simplified)
function route = aodv(source, destination, adjacencyMatrix, blackholeNode)
    % Apply shortest path algorithm (e.g., Dijkstra's algorithm)
    % Here, we assume a simple shortest path calculation
    route = shortestpath(graph(adjacencyMatrix), source, destination);
    
    % Introduce blackhole node if specified
    if nargin == 4 && blackholeNode > 0 && blackholeNode <= size(adjacencyMatrix, 1)
        % Check if blackhole node is already in the route
        if any(route == blackholeNode)
            % If blackhole node is already in the route, remove it
            route(route == blackholeNode) = [];
        end
        % Find the index where blackhole node should be inserted
        insertionIndex = find(route == destination);
        % Insert blackhole node into the route
        route = [route(1:insertionIndex) blackholeNode route(insertionIndex+1:end)];
    end
end

% Test AODV routing with and without blackhole node
sourceNode = 1;
destinationNode = numNodes;

% Without blackhole
routeWithoutBlackhole = aodv(sourceNode, destinationNode, adjacencyMatrix);
disp('Route without blackhole:');
disp(routeWithoutBlackhole);

% With blackhole
blackholeNode = 10; % Introduce blackhole at node 10
routeWithBlackhole = aodv(sourceNode, destinationNode, adjacencyMatrix, blackholeNode);
disp('Route with blackhole:');
disp(routeWithBlackhole);

% Visualization of blackhole attack
figure;
p = plot(G, 'XData', nodePositions(:,1), 'YData', nodePositions(:,2), 'NodeLabel', {});
highlight(p, sourceNode, 'NodeColor', 'r', 'MarkerSize', 10);
highlight(p, destinationNode, 'NodeColor', 'r', 'MarkerSize', 10);
highlight(p, blackholeNode, 'NodeColor', 'g', 'MarkerSize', 10);
highlight(p, routeWithoutBlackhole, 'EdgeColor', 'b', 'LineWidth', 2);
highlight(p, routeWithBlackhole, 'EdgeColor', 'r', 'LineWidth', 2);
legend('Nodes', 'Source/Destination', 'Blackhole', 'Route without blackhole', 'Route with blackhole');
title('Visualization of Blackhole Attack');

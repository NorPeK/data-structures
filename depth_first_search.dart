void main() {
  // Create a sample graph represented as an adjacency list
  // The graph is a Map where each key is a node (String),
  // and the value is a list of connected nodes (List<String>)
  var graph = {
    'A': ['B', 'C'], // Node A is connected to nodes B and C
    'B': ['D', 'E'], // Node B is connected to nodes D and E
    'C': ['F'], // Node C is connected to node F
    'D': [], // Node D has no connections
    'E': ['F'], // Node E is connected to node F
    'F': [] // Node F has no connections
  };

  // Perform and print the results of a recursive DFS starting from node 'A'
  print('Recursive DFS:');
  dfsRecursive(graph, 'A');

  // Perform and print the results of an iterative DFS starting from node 'A'
  print('\nIterative DFS:');
  dfsIterative(graph, 'A');
}

// Recursive DFS implementation
// Parameters:
// - graph: The graph represented as a Map with dynamic keys and values
// - start: The starting node for the DFS traversal
// - visited: A Set of visited nodes to avoid cycles (optional parameter)
//            If not provided, it is initialized as an empty Set
void dfsRecursive(Map<dynamic, List<dynamic>> graph, String start,
    [Set<String>? visited]) {
  // Initialize the visited set if it is not provided
  visited ??= <String>{};

  // Mark the current node as visited by adding it to the set
  visited.add(start);
  print(start); // Print the current node

  // Recur for each neighbor of the current node
  // graph[start] returns the list of neighbors of the start node
  for (var neighbor in graph[start]!) {
    // If the neighbor hasn't been visited, recursively visit it
    if (!visited.contains(neighbor)) {
      dfsRecursive(graph, neighbor, visited);
    }
  }
}

// Iterative DFS implementation using a stack
// Parameters:
// - graph: The graph represented as a Map with dynamic keys and values
// - start: The starting node for the DFS traversal
void dfsIterative(Map<dynamic, List<dynamic>> graph, String start) {
  // A set to keep track of visited nodes to avoid cycles
  var visited = <String>{};

  // A stack to manage the nodes to be visited
  var stack = <String>[];
  stack.add(start); // Start by adding the initial node to the stack

  // Loop until there are no nodes left to visit
  while (stack.isNotEmpty) {
    // Pop the last node from the stack
    var vertex = stack.removeLast();

    // If the node hasn't been visited, mark it as visited
    if (!visited.contains(vertex)) {
      visited.add(vertex);
      print(vertex); // Print the current node

      // Add the neighbors of the current node to the stack
      // We reverse the list to ensure the correct order in DFS
      for (var neighbor in graph[vertex]!.reversed) {
        // Add the neighbor to the stack if it hasn't been visited
        if (!visited.contains(neighbor)) {
          stack.add(neighbor);
        }
      }
    }
  }
}

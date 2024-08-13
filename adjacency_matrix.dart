import 'dart:io'; // Importing 'dart:io' to use stdout.write for printing without a newline

// Node class representing a single node in the graph
class Node {
  final int id; // Unique identifier for the node

  // Constructor to initialize the node with a unique id
  Node(this.id);

  // Override the toString method to provide a readable representation of the node
  @override
  String toString() => 'Node $id';
}

// Graph class representing the entire graph using an adjacency matrix
class Graph {
  final int size; // The number of nodes in the graph
  late List<List<int>>
      adjacencyMatrix; // 2D list representing the adjacency matrix

  // Constructor to initialize the graph with a given number of nodes
  Graph(this.size) {
    // Generate the adjacency matrix with all values initialized to 0
    // List.generate creates a list with 'size' elements, each being a list filled with 0s
    adjacencyMatrix = List.generate(size, (i) => List.filled(size, 0));
  }

  // Method to add an edge between two nodes in the graph
  void addEdge(Node from, Node to) {
    int fromIndex = from.id; // Get the index of the 'from' node
    int toIndex = to.id; // Get the index of the 'to' node

    // Since this is an undirected graph, set both directions in the adjacency matrix to 1
    adjacencyMatrix[fromIndex][toIndex] =
        1; // Set the value indicating an edge from 'from' to 'to'
    adjacencyMatrix[toIndex][fromIndex] =
        1; // Set the value indicating an edge from 'to' to 'from'
  }

  // Method to remove an edge between two nodes in the graph
  void removeEdge(Node from, Node to) {
    int fromIndex = from.id; // Get the index of the 'from' node
    int toIndex = to.id; // Get the index of the 'to' node

    // Since this is an undirected graph, remove the edge in both directions by setting the value to 0
    adjacencyMatrix[fromIndex][toIndex] =
        0; // Remove the edge from 'from' to 'to'
    adjacencyMatrix[toIndex][fromIndex] =
        0; // Remove the edge from 'to' to 'from'
  }

  // Method to check if there is an edge between two nodes
  bool hasEdge(Node from, Node to) {
    // Return true if there is an edge (value is 1), false otherwise
    return adjacencyMatrix[from.id][to.id] == 1;
  }

  // Method to display the adjacency matrix
  void display() {
    print('Adjacency Matrix:'); // Print a header for the matrix
    for (int i = 0; i < size; i++) {
      // Iterate over each row
      for (int j = 0; j < size; j++) {
        // Iterate over each column in the row
        stdout.write(
            '${adjacencyMatrix[i][j]} '); // Print each value in the row with a space
      }
      print(''); // After printing all columns in a row, move to the next line
    }
  }
}

void main() {
  // Create nodes with unique identifiers
  Node node0 = Node(0);
  Node node1 = Node(1);
  Node node2 = Node(2);
  Node node3 = Node(3);

  // Create a graph with 4 nodes
  Graph graph = Graph(4);

  // Add edges between nodes to create connections in the graph
  graph.addEdge(node0, node1); // Add an edge between node 0 and node 1
  graph.addEdge(node0, node2); // Add an edge between node 0 and node 2
  graph.addEdge(node1, node2); // Add an edge between node 1 and node 2
  graph.addEdge(node2, node3); // Add an edge between node 2 and node 3

  // Display the adjacency matrix to show the current graph structure
  graph.display();

  // Check if there is an edge between node 0 and node 2
  if (graph.hasEdge(node0, node2)) {
    print(
        'There is an edge between ${node0} and ${node2}.'); // Print confirmation if an edge exists
  } else {
    print(
        'There is no edge between ${node0} and ${node2}.'); // Print if no edge exists
  }

  // Check if there is an edge between node 1 and node 3
  if (graph.hasEdge(node1, node3)) {
    print(
        'There is an edge between ${node1} and ${node3}.'); // Print confirmation if an edge exists
  } else {
    print(
        'There is no edge between ${node1} and ${node3}.'); // Print if no edge exists
  }

  // Remove an edge between node 0 and node 2
  graph.removeEdge(node0, node2);

  // Display the adjacency matrix again to show the updated graph structure
  print('Adjacency Matrix after removing the edge between node 0 and node 2:');
  graph.display();
}

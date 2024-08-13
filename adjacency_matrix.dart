// Adjacency matrix is a 2D array to store 1's and 0's to represent edges
// number of rows equal to number of unique nodes
// number of columns equal to number of unique nodes
// runtime complexity to check an edge is O(1)
// space complexity is O(n^2)

import 'dart:io';

class Node {
  final int id;

  Node(this.id);

  @override
  String toString() => 'Node $id';
}

class Graph {
  final int size;
  late List<List<int>> adjacencyMatrix;

  Graph(this.size) {
    // Initialize the adjacency matrix with 0s
    adjacencyMatrix = List.generate(size, (i) => List.filled(size, 0));
  }

  void addEdge(Node from, Node to) {
    int fromIndex = from.id;
    int toIndex = to.id;

    // For an undirected graph, set both directions
    adjacencyMatrix[fromIndex][toIndex] = 1;
    adjacencyMatrix[toIndex][fromIndex] = 1;
  }

  void removeEdge(Node from, Node to) {
    int fromIndex = from.id;
    int toIndex = to.id;

    // For an undirected graph, remove both directions
    adjacencyMatrix[fromIndex][toIndex] = 0;
    adjacencyMatrix[toIndex][fromIndex] = 0;
  }

  bool hasEdge(Node from, Node to) {
    return adjacencyMatrix[from.id][to.id] == 1;
  }

  void display() {
    print('Adjacency Matrix:');
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        stdout.write('${adjacencyMatrix[i][j]} ');
      }
      print(''); // Move to the next line after printing each row
    }
  }
}

void main() {
  // Create nodes
  Node node0 = Node(0);
  Node node1 = Node(1);
  Node node2 = Node(2);
  Node node3 = Node(3);

  // Create a graph with 4 nodes
  Graph graph = Graph(4);

  // Add edges between nodes
  graph.addEdge(node0, node1);
  graph.addEdge(node0, node2);
  graph.addEdge(node1, node2);
  graph.addEdge(node2, node3);

  // Display the adjacency matrix
  graph.display();

  // Check for an edge between node 0 and node 2
  if (graph.hasEdge(node0, node2)) {
    print('There is an edge between ${node0} and ${node2}.');
  } else {
    print('There is no edge between ${node0} and ${node2}.');
  }

  // Check for an edge between node 1 and node 3
  if (graph.hasEdge(node1, node3)) {
    print('There is an edge between ${node1} and ${node3}.');
  } else {
    print('There is no edge between ${node1} and ${node3}.');
  }

  // Remove an edge between node 0 and node 2
  graph.removeEdge(node0, node2);

  // Display the adjacency matrix again
  print('Adjacency Matrix after removing the edge between node 0 and node 2:');
  graph.display();
}

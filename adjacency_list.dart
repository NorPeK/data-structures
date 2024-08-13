// Adjacency List is an arraylist of linkedLists.
// Each linkedList has a unique node at the head.
// All adjacent neighbors to that node are added to that node's linkedList
// runtime complexity to check an Edge is O(n)
// space complexity is O(n+e)

import 'dart:io';

// Class representing a node in the graph
class Node {
  final int id; // Unique identifier for the node

  // Constructor to initialize the node with its id
  Node(this.id);

  // Override the toString method to print the node's id when the node is printed
  @override
  String toString() => 'Node $id';
}

// Class representing the graph using an adjacency list
class Graph {
  final int size; // Number of nodes in the graph
  late List<List<Node>>
      adjacencyList; // The adjacency list to store connections between nodes

  // Constructor to initialize the graph with the specified size
  Graph(this.size) {
    // Initialize the adjacency list with empty lists for each node
    adjacencyList = List.generate(size, (i) => []);
  }

  // Method to add an edge between two nodes
  void addEdge(Node from, Node to) {
    int fromIndex = from.id; // Get the index of the 'from' node

    // Add the 'to' node to the adjacency list of the 'from' node
    adjacencyList[fromIndex].add(to);

    // Since the graph is undirected, add the 'from' node to the 'to' node's adjacency list
    adjacencyList[to.id].add(from);
  }

  // Method to remove an edge between two nodes
  void removeEdge(Node from, Node to) {
    int fromIndex = from.id; // Get the index of the 'from' node

    // Remove the 'to' node from the adjacency list of the 'from' node
    adjacencyList[fromIndex].remove(to);

    // Since the graph is undirected, remove the 'from' node from the 'to' node's adjacency list
    adjacencyList[to.id].remove(from);
  }

  // Method to check if there is an edge between two nodes
  bool hasEdge(Node from, Node to) {
    // Check if the 'to' node is in the adjacency list of the 'from' node
    return adjacencyList[from.id].contains(to);
  }

  // Method to display the adjacency list of the graph
  void display() {
    print('Adjacency List:'); // Print a header for clarity
    for (int i = 0; i < size; i++) {
      // Iterate over each node
      stdout.write(
          'Node $i: '); // Print the node id followed by its adjacency list
      for (Node node in adjacencyList[i]) {
        // Iterate over the adjacent nodes
        stdout.write('${node.id} '); // Print the id of each adjacent node
      }
      print(
          ''); // Move to the next line after printing the adjacency list for each node
    }
  }
}

void main() {
  // Create nodes with unique ids
  Node node0 = Node(0);
  Node node1 = Node(1);
  Node node2 = Node(2);
  Node node3 = Node(3);

  // Create a graph with 4 nodes
  Graph graph = Graph(4);

  // Add edges between nodes
  graph.addEdge(node0, node1); // Edge between node 0 and node 1
  graph.addEdge(node0, node2); // Edge between node 0 and node 2
  graph.addEdge(node1, node2); // Edge between node 1 and node 2
  graph.addEdge(node2, node3); // Edge between node 2 and node 3

  // Display the adjacency list of the graph
  graph.display();

  // Check if there is an edge between node 0 and node 2
  if (graph.hasEdge(node0, node2)) {
    print('There is an edge between ${node0} and ${node2}.');
  } else {
    print('There is no edge between ${node0} and ${node2}.');
  }

  // Check if there is an edge between node 1 and node 3
  if (graph.hasEdge(node1, node3)) {
    print('There is an edge between ${node1} and ${node3}.');
  } else {
    print('There is no edge between ${node1} and ${node3}.');
  }

  // Remove an edge between node 0 and node 2
  graph.removeEdge(node0, node2);

  // Display the adjacency list again to show the result after removing the edge
  print('Adjacency List after removing the edge between node 0 and node 2:');
  graph.display();
}

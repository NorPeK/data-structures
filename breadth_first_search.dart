/*
BFS a search algorithm for traversing a tree or graph data structure
this is done one level at a time rather than one branch at a time

Differences between BFS and DFS:
BFS: traverse a graph level by level | Utilizes a queue | Better if destination
is on average close to start | Siblings are visited before children

DFS: traverse a graph branch by branch | Utilizes a stack | Better if
destination is on average far from the start | Children are visited before
sibilings | More popular for games/puzzles
*/

import 'dart:collection'; // Importing the collection library to use Queue

// Class representing a Graph
class Graph {
  int vertices; // Number of vertices in the graph
  List<List<int>>? adjacencyList; // Adjacency list to store edges (nullable)

  // Constructor to initialize the graph with a specified number of vertices
  Graph(this.vertices) {
    // Initialize the adjacency list with empty lists for each vertex
    adjacencyList = List<List<int>>.generate(vertices, (_) => []);
  }

  // Method to add an edge to the graph
  void addEdge(int v, int w) {
    adjacencyList?[v]
        .add(w); // Add vertex 'w' to the list of adjacent vertices of 'v'
  }

  // Method to perform Breadth-First Search starting from a given vertex
  void bfs(int startVertex) {
    // List to keep track of visited vertices
    List<bool> visited = List<bool>.filled(vertices, false);

    // Queue to manage the order of visiting vertices
    Queue<int> queue = Queue<int>();

    // Mark the start vertex as visited and add it to the queue
    visited[startVertex] = true;
    queue.add(startVertex);

    // Loop until there are no more vertices to visit in the queue
    while (queue.isNotEmpty) {
      // Remove and return the first vertex from the queue
      int vertex = queue.removeFirst();
      print('Visited $vertex'); // Print the visited vertex

      // Iterate through all adjacent vertices of the current vertex
      for (int adjacentVertex in adjacencyList![vertex]) {
        // If the adjacent vertex has not been visited
        if (!visited[adjacentVertex]) {
          visited[adjacentVertex] = true; // Mark it as visited
          queue.add(
              adjacentVertex); // Add it to the queue for future exploration
        }
      }
    }
  }
}

// Main function to execute the graph traversal
void main() {
  // Create a graph with 6 vertices (0 to 5)
  Graph graph = Graph(6);

  // Add edges to the graph
  graph.addEdge(0, 1); // Edge from vertex 0 to vertex 1
  graph.addEdge(0, 2); // Edge from vertex 0 to vertex 2
  graph.addEdge(1, 3); // Edge from vertex 1 to vertex 3
  graph.addEdge(1, 4); // Edge from vertex 1 to vertex 4
  graph.addEdge(2, 5); // Edge from vertex 2 to vertex 5

  // Print the starting point of the BFS traversal
  print('Breadth First Search starting from vertex 0:');

  // Perform BFS starting from vertex 0
  graph.bfs(0);
}

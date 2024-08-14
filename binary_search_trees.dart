// tree is a non-linear data structure where nodes are organized in a hierarchy
// it is used in File explorer, databases, DNS, HTML DOM
// The top of the tree is called root
// subtree is a smaller tree held within a larger tree
// the size of the tree is equal to the number of nodes
// the depth of a tree is the number of edges below the root node
// the height of a tree is the number edges above the furthest leaf node.
// a binary tree is a tree where each parent have no more than two childrens.
// in BST the parent should be bigger than the left child branch and the less than the right child branch.
// the time complexity of BTS is O(log n) in best case

import 'dart:io'; // Importing the dart:io library to use stdout for custom printing

// A class that represents a node in a binary search tree
class Node<T extends Comparable> {
  T value; // The value stored in the node, which must be of a type that implements Comparable
  Node<T>? left; // A reference to the left child node (subtree)
  Node<T>? right; // A reference to the right child node (subtree)

  // Constructor to create a node with a given value
  Node(this.value);
}

// A class that represents a binary search tree (BST)
class BinarySearchTree<T extends Comparable> {
  Node<T>? root; // The root node of the BST, initially null

  // Method to insert a new value into the BST
  void insert(T value) {
    root = _insert(root, value); // Start the insertion process from the root
  }

  // Helper method to recursively insert a value in the BST
  Node<T>? _insert(Node<T>? node, T value) {
    if (node == null) {
      // Base case: if the current node is null, we've found the spot to insert the new value
      return Node(value); // Create a new node with the value and return it
    }

    // If the new value is less than the current node's value, go to the left subtree
    if (value.compareTo(node.value) < 0) {
      node.left =
          _insert(node.left, value); // Recursively insert in the left subtree
    }
    // If the new value is greater than the current node's value, go to the right subtree
    else if (value.compareTo(node.value) > 0) {
      node.right =
          _insert(node.right, value); // Recursively insert in the right subtree
    }

    return node; // Return the node after insertion (no change if it's not null)
  }

  // Method to search for a value in the BST
  bool search(T value) {
    return _search(root, value); // Start the search from the root
  }

  // Helper method to recursively search for a value in the BST
  bool _search(Node<T>? node, T value) {
    if (node == null) {
      // Base case: if the node is null, the value is not in the tree
      return false;
    }

    if (value == node.value) {
      // If the value matches the current node's value, it's found
      return true;
    }
    // If the value is less than the current node's value, search in the left subtree
    else if (value.compareTo(node.value) < 0) {
      return _search(
          node.left, value); // Recursively search in the left subtree
    }
    // If the value is greater than the current node's value, search in the right subtree
    else {
      return _search(
          node.right, value); // Recursively search in the right subtree
    }
  }

  // Method to perform an in-order traversal of the BST and print the values
  void inOrderTraversal() {
    _inOrderTraversal(root); // Start the traversal from the root
    print(''); // Print a newline after the traversal is complete
  }

  // Helper method to recursively perform an in-order traversal
  void _inOrderTraversal(Node<T>? node) {
    if (node != null) {
      // If the node is not null, traverse the tree
      _inOrderTraversal(node.left); // First, traverse the left subtree
      stdout.write(
          '${node.value} '); // Then, print the current node's value without a newline
      _inOrderTraversal(node.right); // Finally, traverse the right subtree
    }
  }
}

void main() {
  final bst =
      BinarySearchTree<int>(); // Create a new binary search tree for integers

  // Insert values into the BST
  bst.insert(10);
  bst.insert(5);
  bst.insert(20);
  bst.insert(3);
  bst.insert(7);
  bst.insert(15);
  bst.insert(30);

  // Perform an in-order traversal and print the BST's values
  print('In-order traversal of BST:');
  bst.inOrderTraversal();

  // Search for specific values in the BST and print the result
  print(
      'Search for 7: ${bst.search(7)}'); // Should print true, as 7 is in the tree
  print(
      'Search for 25: ${bst.search(25)}'); // Should print false, as 25 is not in the tree
}

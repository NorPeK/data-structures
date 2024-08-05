void main() {
  // Create a stack instance of integers
  Stack<int> stack = Stack<int>();

  // Push elements onto the stack
  stack.push(10); // Add 10 to the stack
  stack.push(20); // Add 20 to the stack
  stack.push(30); // Add 30 to the stack

  // Print the stack contents
  print("Stack after pushing elements: ${stack.items}");

  // Pop an element from the stack
  int poppedElement = stack.pop(); // Remove and get the top element (30)
  print("Popped element: $poppedElement");

  // Print the stack contents after popping an element
  print("Stack after popping an element: ${stack.items}");

  // Check the top element of the stack
  int topElement = stack.top(); // Get the top element (20) without removing it
  print("Top element: $topElement");

  // Check if the stack is empty
  bool isEmpty = stack.isEmpty(); // Check if the stack is empty (false)
  print("Is stack empty? $isEmpty");
}

// Define a generic Stack class
class Stack<T> {
  // Private list to hold the stack elements
  List<T> _items = [];

  // Method to push an element onto the stack
  void push(T element) {
    _items.add(element); // Add element to the end of the list
  }

  // Method to pop an element from the stack
  T pop() {
    if (_items.isNotEmpty) {
      // Check if the stack is not empty
      return _items.removeLast(); // Remove and return the last element
    } else {
      throw Exception(
          "Stack is empty"); // Throw an exception if the stack is empty
    }
  }

  // Method to get the top element of the stack
  T top() {
    if (_items.isNotEmpty) {
      // Check if the stack is not empty
      return _items.last; // Return the last element
    } else {
      throw Exception(
          "Stack is empty"); // Throw an exception if the stack is empty
    }
  }

  // Method to check if the stack is empty
  bool isEmpty() {
    return _items.isEmpty; // Return true if the stack is empty, false otherwise
  }

  // Getter to return the list of elements in the stack
  List<T> get items => _items;
}

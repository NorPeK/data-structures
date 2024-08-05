// Node class representing each element in the linked list
class Node<T> {
  T data; // The data stored in the node
  Node<T>? next; // Pointer to the next node in the list

  // Constructor for the Node class
  Node(this.data, [this.next]);
}

// LinkedList class managing the nodes
class LinkedList<T> {
  Node<T>? head; // Pointer to the first node in the list

  // Add a new node at the end of the list
  void add(T data) {
    // If the list is empty, set the new node as the head
    if (head == null) {
      head = Node<T>(data);
    } else {
      // Otherwise, traverse to the end of the list and add the new node
      Node<T>? current = head;
      // using ! in current! tells dart that current.next is definetely not null.
      while (current!.next != null) {
        current = current.next;
      }
      current.next = Node<T>(data);
    }
  }

  // Display the list elements
  void display() {
    Node<T>? current = head;
    // Traverse the list and print each node's data
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  // Find an element in the list
  bool contains(T data) {
    Node<T>? current = head;
    // Traverse the list to check if any node contains the data
    while (current != null) {
      if (current.data == data) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  // Remove an element from the list
  void remove(T data) {
    // If the list is empty, do nothing
    if (head == null) return;

    // If the head node contains the data, remove the head
    if (head!.data == data) {
      head = head!.next;
      return;
    }

    Node<T>? current = head;
    // Traverse the list to find the node before the node to be removed
    while (current!.next != null) {
      if (current.next!.data == data) {
        // Remove the node by updating the next pointer of the previous node
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }
}

void main() {
  // Create a new linked list of integers
  LinkedList<int> list = LinkedList<int>();
  // Add elements to the list
  list.add(1);
  list.add(2);
  list.add(3);

  // Display the list
  print('Linked List:');
  list.display();

  // Check if the list contains certain elements
  print('Contains 2: ${list.contains(2)}');
  print('Contains 4: ${list.contains(4)}');

  // Remove an element from the list
  list.remove(2);
  // Display the list after removal
  print('Linked List after removing 2:');
  list.display();
}

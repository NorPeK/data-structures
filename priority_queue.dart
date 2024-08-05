void main() {
  // Create an instance of PriorityQueue for integers
  PriorityQueue<int> pq = PriorityQueue<int>();

  // Add elements to the priority queue
  pq.enqueue(4);
  pq.enqueue(3);
  pq.enqueue(2);
  pq.enqueue(5);
  pq.enqueue(7);
  pq.enqueue(6);
  print("Queue before priority sorting:");
  pq.printQueue();
  print('Priority Queue:');
  pq.printPriorityQueue();

  // Dequeue elements and print them until the priority queue is empty
  while (!pq.isEmpty) {
    print("${pq.dequeue()} is removed."); // Outputs: 5, 4, 2, 1
  }
}

class PriorityQueue<T extends Comparable> {
  // List to hold the heap elements
  List<T> _heap = [];
  List<T> _heapBeforeSorting = [];

  // Method to add an element to the priority queue
  void enqueue(T element) {
    _heap.add(element); // Add element to the end of the list
    _heapBeforeSorting.add(element);
    _heapifyUp(
        _heap.length - 1); // Restore the heap property by moving the element up
  }

  // Method to remove and return the highest priority element
  T dequeue() {
    if (_heap.isEmpty)
      throw StateError(
          'Priority queue is empty'); // Check if the queue is empty

    T result = _heap
        .first; // The highest priority element is at the root (first element)
    _heap.first = _heap.last; // Move the last element to the root
    _heap.removeLast(); // Remove the last element
    _heapifyDown(0); // Restore the heap property by moving the element down

    return result; // Return the highest priority element
  }

  // Getter to check if the priority queue is empty
  bool get isEmpty => _heap.isEmpty;

  // Method to restore the heap property by moving an element up
  void _heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2; // Calculate the parent's index
      if (_heap[index].compareTo(_heap[parentIndex]) <= 0)
        break; // If heap property is satisfied, stop

      _swap(index, parentIndex); // Swap the element with its parent
      index = parentIndex; // Move up to the parent's index
    }
  }

  // Method to restore the heap property by moving an element down
  void _heapifyDown(int index) {
    int lastIndex = _heap.length - 1; // Get the last index of the heap

    while (true) {
      int leftChildIndex = 2 * index + 1; // Calculate the left child's index
      int rightChildIndex = 2 * index + 2; // Calculate the right child's index
      int swapIndex = index; // Initialize swap index to the current index

      // If the left child is larger than the current element, set swap index to left child
      if (leftChildIndex <= lastIndex &&
          _heap[leftChildIndex].compareTo(_heap[swapIndex]) > 0) {
        swapIndex = leftChildIndex;
      }

      // If the right child is larger than the element at swap index, set swap index to right child
      if (rightChildIndex <= lastIndex &&
          _heap[rightChildIndex].compareTo(_heap[swapIndex]) > 0) {
        swapIndex = rightChildIndex;
      }

      // If no swaps are needed, the heap property is restored
      if (swapIndex == index) break;

      _swap(index, swapIndex); // Swap the element with the larger child
      index = swapIndex; // Move down to the child's index
    }
  }

  // Helper method to swap two elements in the heap
  void _swap(int index1, int index2) {
    T temp = _heap[index1]; // Temporary variable to hold one element
    _heap[index1] = _heap[index2]; // Assign the second element to the first
    _heap[index2] = temp; // Assign the temporary variable to the second element
  }

  void printPriorityQueue() {
    print(_heap); // Print the list that represents the heap
  }

  void printQueue() {
    print(_heapBeforeSorting); // Print the list that represents the heap
  }
}

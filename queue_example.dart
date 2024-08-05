class Queue<T> {
  List<T> _list = [];

  // Add an element to the back of the queue
  void enqueue(T value) {
    _list.add(value);
  }

  // Remove an element from the front of the queue
  T? dequeue() {
    if (_list.isNotEmpty) {
      return _list.removeAt(0);
    }
    return null;
  }

  // Peek at the front element without removing it
  T? peek() {
    if (_list.isNotEmpty) {
      return _list.first;
    }
    return null;
  }

  // Check if the queue is empty
  bool isEmpty() {
    return _list.isEmpty;
  }

  // Get the length of the queue
  int get length {
    return _list.length;
  }
}

void main() {
  Queue<int> queue = Queue<int>();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  print('Front element: ${queue.peek()}'); // Front element: 1
  print('Queue length: ${queue.length}'); // Queue length: 3

  print('Dequeue: ${queue.dequeue()}'); // Dequeue: 1
  print('Queue length: ${queue.length}'); // Queue length: 2

  print('Front element: ${queue.peek()}'); // Front element: 2
  print('Is queue empty? ${queue.isEmpty()}'); // Is queue empty? false

  queue.dequeue();
  queue.dequeue();

  print('Is queue empty? ${queue.isEmpty()}'); // Is queue empty? true
}

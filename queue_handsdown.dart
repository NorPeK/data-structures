/*
Queue = FIFO data structure. First-in First-Out (line of people)
it is a collection designed for holding elements prior to processing linear data structure
it is a linear data structure.
Queues are useful for keyboard buffers as letters should appear on the screen in the order they're pressed
It is a printer queue meaning that print jobs should be completed in order.
It is used in LinkedLists, PriorityQueues, Breadth-first search.
*/

import 'dart:collection';

void main() {
  Queue<String> queue = new Queue<String>();
  print(queue.isEmpty);

  queue.add("FF10"); // add is enqueue
  queue.add("FF13");
  queue.add("FF15");
  queue.addAll(["FF7", "FF3", "FF6"]);
  queue.add("FF14");
  queue.addFirst("FF1");
  queue.addLast("FF16");
  queue.add("FF12");
  print("Queue size is: ${queue.length}");
  print(queue); // print all the elements of a queue
  print(queue.first); //FF1
  queue.removeFirst(); // removes FF1
  print(queue);
  print("Queue size is: ${queue.length}"); // 9 since FF1 is removed
  print(queue.contains("FF13")); // true
}

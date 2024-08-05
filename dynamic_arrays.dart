// in dynamic arrays we can access any element randomly in a constant time O(1) the size doesn't matter.
// in dynamic arrays, searching for an element takes O(n) time

void main() {
  // Create an empty dynamic array
  List<int> dynamicArray = [];

  // Adding elements to the dynamic array
  dynamicArray.add(10);
  dynamicArray.add(20);
  dynamicArray.add(30);

  // Printing the elements of the dynamic array
  print('Elements of dynamicArray: $dynamicArray');

  // Adding more elements dynamically
  dynamicArray.add(40);
  dynamicArray.add(50);

  // Printing the updated elements of the dynamic array
  print('Updated elements of dynamicArray: $dynamicArray');

  // Accessing elements by index
  print('Element at index 2: ${dynamicArray[2]}');

  // Updating an element at a specific index
  dynamicArray[1] = 25;
  print('After updating, elements of dynamicArray: $dynamicArray');

  // Removing an element by value
  dynamicArray.remove(30);
  print('After removing 30, elements of dynamicArray: $dynamicArray');

  // Removing an element by index
  dynamicArray.removeAt(1);
  print(
      'After removing element at index 1, elements of dynamicArray: $dynamicArray');

  // Iterating through the dynamic array
  print('Iterating through dynamicArray:');
  for (int element in dynamicArray) {
    print(element);
  }
}

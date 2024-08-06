/*
insertion sort happens after comparing elements to the left by shifting elements to the right to make room to insert a value.
it has Quadratic time complexity O(n^2)
Best case is O(n) compared to selection sort O(n^2)
*/

void main() {
  String result = '';
  List<int> list = [9, 1, 8, 2, 7, 3, 6, 5, 4];
  list.forEach((element) {
    result += element.toString();
  });
  print(result);

  insertionSort(list);

  String result2 = "";
  list.forEach((element) {
    result2 += element.toString();
  });
  print(result2);
}

void insertionSort(List<int> list) {
  // Iterate over each element starting from the second element
  for (int i = 1; i < list.length; i++) {
    // Store the current element in a temporary variable
    int temp = list[i];
    int j;

    // Iterate over the sorted segment and shift elements forward
    for (j = i - 1; j >= 0 && list[j] > temp; j--) {
      // Shift the element one position to the right
      list[j + 1] = list[j];
    }

    // Place the temporary value in its correct position
    list[j + 1] = temp;
  }
}

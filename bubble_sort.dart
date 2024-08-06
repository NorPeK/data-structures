/*
bubble sort has time complexity of O(n^2).
the larger the dataset, the more inefficient it will be.ArgumentError
pairs of adjacent elements are compared, and the elements are swapped if they are not in order.part
*/

void main() {
  String result = '';
  String result2 = '';
  List<int> list = [9, 1, 8, 2, 7, 3, 6, 4, 5];
  print(list.length);
  list.forEach((list) {
    result += list.toString();
  });
  print(result);
  bubbleSort(list);
  list.forEach((list) {
    result2 += list.toString();
  });
  print(result2);
}

// Lists are reference type. and not primitive like integer value types.
// reference means its value can change when passed even if it is void.
void bubbleSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    for (int j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}

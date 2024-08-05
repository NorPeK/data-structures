// First, we must sort the elements.
// it is efficent with very very large datasets.
// it has a complexity time of O(log n)

void main() {
  int target = 55;
  List<int> list = [];
  for (int i = 1; i <= 100; i++) {
    list.add(i);
  }
  print(list);
  print(list.length);
  int index = binarySearch(list, target);
  if (index == -1) {
    print("value not found");
  } else {
    print("target found $index");
  }
}

int binarySearch(List<int> list, int target) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    int middle = low + (high - low) ~/ 2;
    int value = list[middle];
    print("middle: $value");
    if (value < target) {
      low = middle + 1;
    } else if (value > target) {
      high = middle - 1;
    } else {
      return middle;
    }
  }

  return -1;
}

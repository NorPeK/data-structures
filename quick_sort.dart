/*
quick sort moves smaller elements to left of a pivot.
recusively divide array in 2 partitions
it has a time complexity of O(n log(n)) as best and average cases and the worst case in O(n^2) if it is already sorted (rare)
space complexiry is O(log(n)) due to recursion
*/
void main() {
  List<int> numbers = [38, 27, 43, 3, 9, 82, 10];
  print('Unsorted List: $numbers');

  quicksort(numbers, 0, numbers.length - 1);

  print('Sorted List: $numbers');
}

void quicksort(List<int> list, int low, int high) {
  if (low < high) {
    int pivotIndex = partition(list, low, high);
    quicksort(list, low, pivotIndex - 1);
    quicksort(list, pivotIndex + 1, high);
  }
}

int partition(List<int> list, int low, int high) {
  int pivot = list[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (list[j] < pivot) {
      i++;
      swap(list, i, j);
    }
  }

  swap(list, i + 1, high);
  return i + 1;
}

void swap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

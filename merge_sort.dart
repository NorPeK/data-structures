/*
ueses recursion
has time complexity of O(n log(n)) Quasilinear time but they use more space
than quadratic sort algorithms merge is O(n) and quad is O(1) in space
*/

void main() {
  // Sample array to be sorted
  List<int> arr = [38, 27, 43, 3, 9, 82, 10];
  print("Original array: $arr");

  // Call mergeSort on the entire array
  mergeSort(arr, 0, arr.length - 1);

  // Print the sorted array
  print("Sorted array: $arr");
}

// Function to implement merge sort
void mergeSort(List<int> arr, int left, int right) {
  if (left < right) {
    // Find the middle point
    int mid = (left + right) ~/ 2;

    // Recursively sort the first and second halves
    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);

    // Merge the sorted halves
    merge(arr, left, mid, right);
  }
}

// Function to merge two halves
void merge(List<int> arr, int left, int mid, int right) {
  // Find sizes of the two subarrays to be merged
  int n1 = mid - left + 1;
  int n2 = right - mid;

  // Create temporary arrays
  List<int> leftArr = List<int>.filled(n1, 0);
  List<int> rightArr = List<int>.filled(n2, 0);

  // Copy data to temporary arrays leftArr[] and rightArr[]
  for (int i = 0; i < n1; i++) {
    leftArr[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArr[j] = arr[mid + 1 + j];
  }

  // Merge the temporary arrays back into arr[left..right]
  int i = 0, j = 0, k = left;

  // Initial index of first subarray is i
  // Initial index of second subarray is j
  // Initial index of merged subarray is k
  while (i < n1 && j < n2) {
    if (leftArr[i] <= rightArr[j]) {
      arr[k] = leftArr[i];
      i++;
    } else {
      arr[k] = rightArr[j];
      j++;
    }
    k++;
  }

  // Copy the remaining elements of leftArr[], if any
  while (i < n1) {
    arr[k] = leftArr[i];
    i++;
    k++;
  }

  // Copy the remaining elements of rightArr[], if any
  while (j < n2) {
    arr[k] = rightArr[j];
    j++;
    k++;
  }
}

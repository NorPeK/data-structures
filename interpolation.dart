// interpolation is improvement over binary search best used for "uniformly" distributed data "guesses"
// where a value might be based on calculated probe results.
// if probe is incorrect, search area is narrowed, and a new probe is calculated.
// average case: O(log(log(n))) worst case O(n) value increases exponentially.

void main() {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 55, 77, 88, 100];
  int index = interpolationSearch(list, 77);

  if (index == -1) {
    print("value not found");
  } else {
    print("target found at index $index");
  }
}

int interpolationSearch(List<int> list, int value) {
  int high = list.length - 1;
  int low = 0;

  while (value >= list[low] && value <= list[high] && low <= high) {
    int probe =
        low + (high - low) * (value - list[low]) ~/ (list[high] - list[low]);
    print("probe count : $probe");

    if (list[probe] == value) {
      return probe;
    } else if (list[probe] < value) {
      low = probe + 1;
    } else {
      high = probe - 1;
    }
  }

  return -1;
}

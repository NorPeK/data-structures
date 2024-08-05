void main() {
  List<int> list = [9, 1, 8, 2, 7, 3, 6, 4, 5];

  linearSearch(list, 5);
}

linearSearch(List<int> list, int value) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == value) {
      print("The index of your value is: $i");
      return i;
    }
  }
  print("Value not found. -1");
  return -1;
}

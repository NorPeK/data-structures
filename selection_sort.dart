/*
in-place sorting algorithm
it has time complexity of O(n^2)
it is ok with small datasets
*/

void main() {
  String result = "";
  List<int> list = [9, 1, 8, 2, 7, 3, 6, 4, 5];
  print(list[4]);

  list.forEach((element) {
    result += element.toString();
  });
  print(result);

  selectionSort(list);
  String result2 = "";
  list.forEach((element) {
    result2 += element.toString();
  });
  print(result2);
}

void selectionSort(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    int min = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[min]) {
        min = j;
      }
    }
    int temp = list[i];
    list[i] = list[min];
    list[min] = temp;
  }
}

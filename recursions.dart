/*
recursion is applying the result of a procedure, to a procedure.
dividing a problem into sub-problems of the same type as the original.
advantages: easier to read/write | easier to debug
disadvantages: sometimes slower | uses more memory
commonly used with advanced sorting algorithms and navigating trees
*/

void main() {
  walk(5);

  walk2(5);

  print(factorial(5));

  print(power(2, 5));
}

// THIS IS ITERATION
void walk(int steps) {
  for (int i = 0; i < steps; i++) {
    print("You take $i steps!");
  }
}

void walk2(int steps) {
  if (steps < 1) {
    return;
  }
  print("You Take $steps Step!");
  walk2(steps - 1);
  print("here is a call stack $steps");
}

int factorial(int num) {
  if (num < 1) {
    return 1; // base case
  }
  return num * factorial(num - 1); // recursive case
}

int power(int base, int exponent) {
  if (exponent < 1) {
    return 1; // base case
  }
  return base * power(base, exponent - 1); // recursive case
}

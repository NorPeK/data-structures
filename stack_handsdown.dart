/* 
stack = LIFO (last in first out) data structure.
stores objects into a sort of "vertical tower".
push() to add to the top.
pop() to remove from the top.
*/

import 'stack_example.dart';

void main() {
  Stack<String> stack = new Stack<String>();

  print(stack.isEmpty()); // true

  stack.push("FF16");
  stack.push("Monster Hunter Rise");
  stack.push("DOOM");
  stack.push("FFVII Remake");
  stack.push("FIFA");

  print(stack.isEmpty()); // false

  print(stack.items); // prints stack objects.

  stack.pop(); // will always remove the top most object from the stack (FIFA)

  print(stack.items); // prints stack objects. FIFA is removed.

  String myFavoriteGame = stack.pop();

  print(stack.items); //prints stack objects.
  print(myFavoriteGame); //FFVII

  print(stack.top()); // check the top most element // DOOM
}

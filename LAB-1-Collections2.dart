import 'dart:math';

void main() {
  List<int> numbers = List.generate(10, (_) => Random().nextInt(10));
  print('Original List: $numbers');
  
  Set<int> uniqueNumbers = numbers.toSet();
  print('Unique Numbers: $uniqueNumbers');
}
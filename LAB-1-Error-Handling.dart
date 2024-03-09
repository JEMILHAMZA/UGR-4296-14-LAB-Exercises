import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  String userInput = stdin.readLineSync()!;
  
  try {
    int number = int.parse(userInput);
    print('Integer value: $number');
  } catch (e) {
    print('Error: Invalid input. Please enter a valid number.');
  }
}
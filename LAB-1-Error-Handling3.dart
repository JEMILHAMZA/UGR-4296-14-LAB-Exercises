import 'dart:io';

void main() {
  try {
    File file = File('example.txt');
    String content = file.readAsStringSync();
    print('File content: $content');
  } catch (e) {
    print('Error: Failed to read file. ${e.toString()}');
  }
}

String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

void main() {
  String original = "hello";
  String reversed = reverseString(original);
  print("Original string: $original");
  print("Reversed string: $reversed");
}

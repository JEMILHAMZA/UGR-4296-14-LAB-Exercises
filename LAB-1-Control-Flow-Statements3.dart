void main() {
  double num1 = 10;
  double num2 = 5;
  String operation = '+';
  double result;
  switch (operation) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      result = num1 / num2;
      break;
    default:
      print("Invalid operation.");
      return;
  }
  print("Result: $result");
}
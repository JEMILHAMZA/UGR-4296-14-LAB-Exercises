double divideNumbers(double a, double b) {
  try {
    return a / b;
  } catch (e) {
    print('Error: Division by zero.');
    return double.nan;
  }
}

void main() {
  double result = divideNumbers(10, 0);
  print('Result: $result');
}

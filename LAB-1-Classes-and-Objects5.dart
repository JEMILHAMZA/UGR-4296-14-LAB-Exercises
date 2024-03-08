abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class Square extends Shape {
  double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

void main() {
  Circle circle = Circle(5);
  print("Circle Area: ${circle.calculateArea()}");

  Square square = Square(4);
  print("Square Area: ${square.calculateArea()}");
}

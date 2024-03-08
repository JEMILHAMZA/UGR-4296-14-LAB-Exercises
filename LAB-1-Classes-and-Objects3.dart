class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double calculateArea() {
    return width * height;
  }

  double calculatePerimeter() {
    return 2 * (width + height);
  }
}

void main() {
  Rectangle rectangle = Rectangle(5, 4);
  print("Area: ${rectangle.calculateArea()}");
  print("Perimeter: ${rectangle.calculatePerimeter()}");
}

class Student extends Person {
  int rollNumber;
  List<int> marks;

  Student(String name, int age, String address, this.rollNumber, this.marks)
      : super(name, age, address);

  int calculateTotalMarks() {
    int total = 0;
    for (int mark in marks) {
      total += mark;
    }
    return total;
  }

  double calculateAverage() {
    int total = calculateTotalMarks();
    return total / marks.length;
  }
}

void main() {
  Student student1 = Student("Alice", 20, "789 Oak St", 101, [85, 90, 75, 95, 80]);
  print("Name: ${student1.name}, Age: ${student1.age}, Address: ${student1.address}");
  print("Roll Number: ${student1.rollNumber}");
  print("Total Marks: ${student1.calculateTotalMarks()}");
  print("Average Marks: ${student1.calculateAverage()}");
}

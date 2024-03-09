class Student {
  String name;
  List<int> marks;
  
  Student(this.name, this.marks);
  
  double calculateAverageMark() {
    if (marks.isEmpty) {
      return 0.0;
    }
    return marks.reduce((a, b) => a + b) / marks.length;
  }
}

void main() {
  Student student1 = Student('Alice', [85, 90, 75]);
  print('${student1.name}\'s Average Mark: ${student1.calculateAverageMark()}');
}
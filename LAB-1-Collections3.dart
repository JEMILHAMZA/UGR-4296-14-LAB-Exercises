void main() {
  Map<String, int> studentMarks = {'Alice': 85, 'Bob': 90, 'Charlie': 75};
  
  studentMarks.putIfAbsent('David', () => 80); // Add if absent
  print(studentMarks);
  
  studentMarks.forEach((name, mark) {
    print('$name scored $mark marks');
  });
  
  bool hasAlice = studentMarks.containsKey('Alice');
  print('Does the map contain Alice? $hasAlice');
}

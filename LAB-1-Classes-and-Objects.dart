class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);
}

void main() {
  Person person1 = Person("John", 30, "123 Main St");
  print("Name: ${person1.name}, Age: ${person1.age}, Address: ${person1.address}");

  // Modifying attributes
  person1.age = 35;
  person1.address = "456 Elm St";
  print("Modified Age: ${person1.age}, Modified Address: ${person1.address}");
}

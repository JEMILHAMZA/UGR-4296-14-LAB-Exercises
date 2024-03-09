void main() {
  List<String> hobbies = ['Reading', 'Gardening', 'Painting'];
  
  hobbies.add('Cooking'); // Add a hobby
  print(hobbies);
  
  hobbies.remove('Gardening'); // Remove a hobby
  print(hobbies);
  
  hobbies.sort(); // Sort hobbies
  print(hobbies);
  
  print('Is the list empty? ${hobbies.isEmpty}');
}

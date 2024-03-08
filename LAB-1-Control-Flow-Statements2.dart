void main() {
  const int speedOfLight = 299792458; 

  
  print("Enter the distance in meters:");
  double distance = double.parse(stdin.readLineSync()!);

  
  double time = distance / speedOfLight;

  print("It takes ${time.toStringAsFixed(9)} seconds for light to travel $distance meters.");
}
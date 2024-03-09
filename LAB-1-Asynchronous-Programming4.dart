import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchWeatherData(String city) async {
  final apiKey = 'af97b033cc396892aacc58a007d813be'; // Sample API key for demonstration
  final url = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final temperature = data['main']['temp'];
      final weatherDescription = data['weather'][0]['description'];
      
      print('Current temperature in $city: $temperature°C');
      print('Weather conditions in $city: $weatherDescription');
    } else {
      print('Failed to fetch weather data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching weather data: $e');
  }
}

void main() {
  final city = 'London'; // Replace with the desired city
  fetchWeatherData(city);
}

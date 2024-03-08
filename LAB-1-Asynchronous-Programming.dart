import 'dart:async';
import 'dart:math';

Future<String> fetchQuote() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  
  // Simulate fetching quote from server
  List<String> quotes = [
    "The only way to do great work is to love what you do. – Steve Jobs",
    "Innovation distinguishes between a leader and a follower. – Steve Jobs",
    "Your time is limited, so don’t waste it living someone else’s life. – Steve Jobs"
  ];

  // Return a random quote
  return quotes[Random().nextInt(quotes.length)];
}

Future<void> main() async {
  print("Fetching quote...");
  String quote = await fetchQuote();
  print("Here's your quote: $quote");
}
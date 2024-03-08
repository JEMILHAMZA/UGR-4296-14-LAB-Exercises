Future<List<String>> fetchDataFromDatabase() async {

  await Future.delayed(Duration(seconds: 2));
  
  
  List<String> data = ['Data 1', 'Data 2', 'Data 3'];
  
  return data;
}

Future<void> main() async {
  print('Fetching data from database...');
  List<String> data = await fetchDataFromDatabase();
  print('Data from database: $data');
}

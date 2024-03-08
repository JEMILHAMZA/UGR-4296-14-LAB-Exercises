import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> downloadFile(String url) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    File file = File('downloaded_file.txt');
    await file.writeAsBytes(response.bodyBytes);
    print('File downloaded successfully!');
  } else {
    print('Failed to download file. Status code: ${response.statusCode}');
  }
}

Future<void> main() async {
  String url = 'https://example.com/file.txt';
  await downloadFile(url);
}

```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // This will throw an exception if the JSON is malformed
      final jsonResponse = jsonDecode(response.body);
      // ... process jsonResponse ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // This catch block only catches exceptions during the HTTP request or JSON decoding.
    // It won't catch runtime exceptions within the ... process jsonResponse ... section.
    print('Error: $e');
    // Handle the error appropriately.
  }
}
```
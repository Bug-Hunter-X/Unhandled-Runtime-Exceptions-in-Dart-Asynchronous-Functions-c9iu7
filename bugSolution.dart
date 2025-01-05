```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      try {
        // Wrap data processing in another try-catch block
        // ... process jsonResponse ... 
        // Example of potential runtime error:
        final value = jsonResponse['nonExistentKey']; //This may throw
      } catch (e) {
        print('Error processing data: $e');
        // Handle the error appropriately.
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Handle the error appropriately.
  }
}
```
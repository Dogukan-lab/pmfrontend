import 'package:http/http.dart' as http;

Future<http.Response?> serverRequest(String request, String? params) async {
  try {
    final response = await http.post(
      Uri.parse('https://localhost:7056/api/$request'),
      headers: {'Content-Type': 'application/json'},
      body: params,
    );
    return response;
  } on http.ClientException catch (e) {
    print(e.message);
    return null;
  }
}

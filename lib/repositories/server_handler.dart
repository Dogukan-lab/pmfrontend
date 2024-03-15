import 'package:http/http.dart' as http;

Future<http.Response> serverRequest(String request, String? params) async {
  final response = await http.post(
    Uri.parse('https://localhost:7056/api/$request'),
    headers: {'Content-Type': 'application/json'},
    body: params,
  );
  return response;
}

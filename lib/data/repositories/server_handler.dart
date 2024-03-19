import 'package:http/http.dart' as http;
import 'package:pmfrontend/main.dart';

enum HttpMethod {
  post,
  get,
}

Future<http.Response?> apiPost(String request, {String? query, String? params}) =>
    _apiRequest(HttpMethod.post, request, query: query, params: params);
Future<http.Response?> apiGet(String request, {String? query, String? params}) => _apiRequest(HttpMethod.get, request, query: query, params: params);

Future<http.Response?> _apiRequest(HttpMethod method, String request, {String? query, String? params}) async {
  try {
    var uri = 'https://localhost:7056/api/$request';
    if (query != null) uri += '?$query';

    final Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiToken',
    };

    switch (method) {
      case HttpMethod.post:
        return await http.post(
          Uri.parse(uri),
          headers: header,
          body: params,
        );
      case HttpMethod.get:
        return await http.get(
          Uri.parse(uri),
          headers: header,
        );
      default:
        throw Exception('Unsupported HTTP method');
    }
  } on http.ClientException catch (e) {
    print('Server Handler: ${e.message}');
    return null;
  }
}

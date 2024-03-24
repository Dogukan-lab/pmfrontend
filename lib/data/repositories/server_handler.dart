import 'package:http/http.dart' as http;
import 'package:pmfrontend/main.dart';

enum HttpMethod {
  post,
  get,
}

String baseURL = "https://localhost:7056/";
// String baseURL = "https://w9dchbd2-7056.euw.devtunnels.ms/";

Future<http.Response?> apiPost(String request, {String? query, String? params}) =>
    _apiRequest(HttpMethod.post, request, query: query, params: params);
Future<http.Response?> apiGet(String request, {String? query, String? params}) => _apiRequest(HttpMethod.get, request, query: query, params: params);

Future<http.Response?> _apiRequest(HttpMethod method, String request, {String? query, String? params}) async {
  try {
    var uri = '${baseURL}api/$request';
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

import 'package:http/http.dart';

enum AppHttpMethod { get, post, patch, put, delete }

abstract class ComunicationService<T> {
  Future<Response> request(
    String uri,
    AppHttpMethod method, {
    T? object,
    Map<String, String>? header,
  });
}

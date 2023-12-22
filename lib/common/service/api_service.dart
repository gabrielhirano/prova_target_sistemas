import 'dart:convert';
import 'package:http/http.dart';
import 'package:target_sistemas_prova_flutter/common/service/comunication_service.dart';

class ApiService<T> implements ComunicationService<T> {
  @override
  Future<Response> request(
    String uri,
    AppHttpMethod method, {
    T? object,
    Map<String, String>? header,
  }) async {
    late Response response;

    response = switch (method) {
      AppHttpMethod.get => await get(Uri.parse(uri)),
      AppHttpMethod.post => await post(Uri.parse(uri), body: object),
      AppHttpMethod.put => await put(Uri.parse(uri), body: header),
      AppHttpMethod.patch => await patch(Uri.parse(uri), body: object),
      AppHttpMethod.delete => await delete(Uri.parse(uri)),
    };

    if (response.statusCode == 200) {
      final Response data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Erro ao obter os dados.');
    }
  }
}

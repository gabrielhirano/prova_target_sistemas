import 'dart:convert';
import 'package:http/http.dart';
import 'package:target_sistemas_prova_flutter/common/constant/login_mock_const.dart';
import 'package:target_sistemas_prova_flutter/common/service/comunication_service.dart';
import 'package:target_sistemas_prova_flutter/common/service/shared_preferences_service.dart';
import 'package:target_sistemas_prova_flutter/common/utils/extensions/int_extensions.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';

class MockApiService<T> implements ComunicationService<T> {
  final SharedPreferencesService sharedPreferences;

  MockApiService(this.sharedPreferences);

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
      AppHttpMethod.post => await postMockLogin(uri, body: object!),
      AppHttpMethod.put => await put(Uri.parse(uri), body: object),
      AppHttpMethod.patch => await patch(Uri.parse(uri), headers: header),
      AppHttpMethod.delete => await delete(Uri.parse(uri)),
    };

    if (response.statusCode.codeSucessfull) {
      // final Response data = jsonDecode(response.body);
      await simulationAwaitingData();
      return response;
    } else {
      throw Exception(response.body);
    }
  }

  Future simulationAwaitingData() async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  Future<Response> postMockLogin(String uri, {required T body}) async {
    if (uri == 'login_mock') {
      if (body is UserModel) {
        if (body.email == LoginMockConst.email) {
          if (body.password == LoginMockConst.password) {
            return Response(
                jsonEncode({'token': 'token_de_autenticacao'}), 200);
          }
          return Response('Senha incorreta, tente novamente!', 404);
        }
        return Response('Usuario não encontrado', 404);
      }
    } else {
      return await post(Uri.parse(uri), body: body);
    }

    return Response('Erro desconhecido', 500);
  }
}

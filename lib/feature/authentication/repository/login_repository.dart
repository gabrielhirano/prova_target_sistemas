import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';
import 'package:target_sistemas_prova_flutter/common/service/comunication_service.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';

class LoginRepository {
  final ComunicationService comunication;

  LoginRepository(this.comunication);

  Future<String> authenticationLogin(UserModel user) async {
    return comunication
        .request('login_mock', AppHttpMethod.post, object: user)
        .then((value) {
      return value.body;
    }).catchError((e) {
      throw CustomException(e.message);
    });
  }
}

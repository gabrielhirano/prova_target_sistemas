import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';
import 'package:target_sistemas_prova_flutter/common/utils/enums/status_response_enum.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/repository/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;
  _LoginControllerBase(this.repository);

  @observable
  StatusResponse status = StatusResponse.idle;

  @observable
  String errorMessage = '';

  @action
  Future<void> authentication(
      {required String email, required String password}) async {
    status = StatusResponse.awaiting;

    try {
      final token =
          await repository.authenticationLogin(UserModel(email, password));
      status = StatusResponse.sucess;
    } catch (error) {
      final customException = error as CustomException;

      errorMessage = customException.message;

      status = StatusResponse.failed;
    }
  }
}

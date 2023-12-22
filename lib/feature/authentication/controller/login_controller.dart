import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';
import 'package:target_sistemas_prova_flutter/common/utils/global_services.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/repository/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

enum StatusResponse { idle, awaiting, sucess, failed }

extension StatusResponseExtensions on StatusResponse {
  bool get isIdle {
    return this == StatusResponse.idle;
  }

  bool get isAwaiting {
    return this == StatusResponse.awaiting;
  }

  bool get hasSucessfull {
    return this == StatusResponse.sucess;
  }

  bool get hasFailed {
    return this == StatusResponse.failed;
  }
}

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;
  _LoginControllerBase(this.repository);

  @observable
  StatusResponse status = StatusResponse.idle;

  @action
  Future<void> authentication(
      {required String email, required String password}) async {
    status = StatusResponse.awaiting;

    try {
      final token =
          await repository.authenticationLogin(UserModel(email, password));
      status = StatusResponse.sucess;
    } catch (e) {
      final customException = e as CustomException;
      appDialog.showAlert(message: customException.message);

      status = StatusResponse.failed;
    }
  }
}

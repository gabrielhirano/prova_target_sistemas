import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova_flutter/common/service/api_data_manager/api_data_manager.dart';
import 'package:target_sistemas_prova_flutter/common/service/app_exceptions.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/repository/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;
  _LoginControllerBase(this.repository);

  @observable
  ApiDataManager<String> dataManager = ApiDataManager<String>();

  @action
  Future<void> authentication(
      {required String email, required String password}) async {
    dataManager.setStatus(ApiDataEnum.awaiting);

    try {
      final token =
          await repository.authenticationLogin(UserModel(email, password));

      dataManager.setStatus(ApiDataEnum.sucess, data: token);
    } catch (error) {
      final customException = error as CustomException;

      dataManager.setStatus(ApiDataEnum.error, error: customException);
    }
  }
}

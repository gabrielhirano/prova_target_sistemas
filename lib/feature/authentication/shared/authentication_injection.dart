import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova_flutter/common/service/comunication_service.dart';
import 'package:target_sistemas_prova_flutter/common/service/mock_api_service.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/controller/login_controller.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/model/user_model.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/repository/login_repository.dart';

mixin AuthenticationInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt
        .registerLazySingleton<LoginController>(() => LoginController(getIt()));
    getIt.registerLazySingleton<ComunicationService>(
        () => MockApiService<UserModel>(getIt()));
    getIt
        .registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  }
}

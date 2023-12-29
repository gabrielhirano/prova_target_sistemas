import 'package:get_it/get_it.dart';

import 'package:target_sistemas_prova_flutter/feature/home/model/text_model.dart';

import '../../../common/service/shared_preferences_service.dart';
import '../controller/home_controller.dart';
import '../repository/text_repository.dart';

mixin HomeInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
    getIt.registerLazySingleton<TextRepository>(() => TextRepository(getIt()));
    getIt.registerLazySingleton<SharedPreferencesService<TextModel>>(
        () => SharedPreferencesService<TextModel>(shared: getIt()));
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova_flutter/common/service/navigate_service.dart';
import 'package:target_sistemas_prova_flutter/common/service/shared_preferences_service.dart';
import 'package:target_sistemas_prova_flutter/common/theme/app_colors.dart';
import 'package:target_sistemas_prova_flutter/feature/authentication/shared/authentication_injection.dart';

import '../../feature/home/shared/home_injection.dart';

final getIt = GetIt.instance;

mixin DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Commons
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    getIt.registerLazySingleton<SharedPreferencesService>(
        () => SharedPreferencesService(shared: sharedPreferences));

    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
    getIt.registerSingleton<NavigatorService>(NavigatorService(navigatorKey));

    // Utils
    getIt.registerLazySingleton<IAppColors>(() => AppColors());

    Future.wait([
      AuthenticationInjection.inject(getIt),
      HomeInjection.inject(getIt),
    ]);
  }
}

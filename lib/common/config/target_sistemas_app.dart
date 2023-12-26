import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova_flutter/common/service/navigate_service.dart';
import 'package:target_sistemas_prova_flutter/feature/home/view/screens/home_screen.dart';

class TargetSistemasApp extends StatefulWidget {
  const TargetSistemasApp({super.key});

  @override
  State<TargetSistemasApp> createState() => _TargetSistemasAppState();
}

class _TargetSistemasAppState extends State<TargetSistemasApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: GetIt.I<NavigatorService>().navigatorKey,
        home: const HomeScreen());
  }
}

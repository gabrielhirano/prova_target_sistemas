import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/config/dependency_injection.dart';
import 'common/config/target_sistemas_app.dart';

void main() async {
  await DependencyInjection.init();
  runApp(const TargetSistemasApp());
}

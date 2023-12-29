import 'package:flutter/material.dart';

abstract class IAppColors {
  final initialGradientColor = const Color(0xFF1E4E62);
  final finalGradientColor = const Color(0xFF2D958E);

  final green = const Color(0xFF44BD6E);
  final black = const Color(0xFF424242);
  final white = const Color(0xFFFFFFFF);

  final red = const Color(0xFFDC3535);
  final blue = const Color(0xFF0456D0);
}

class AppColors extends IAppColors {}

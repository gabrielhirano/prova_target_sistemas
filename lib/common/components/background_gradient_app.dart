import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/theme/theme_global.dart';

class BackgroundGradientVerticalApp extends StatelessWidget {
  final Color initialColor;
  final Color finalColor;
  final Widget child;

  const BackgroundGradientVerticalApp(
      {super.key,
      required this.initialColor,
      required this.finalColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            initialColor,
            finalColor,
          ],
        ),
      ),
      child: child,
    );
  }
}

class BackgroundGradientDefaultApp extends BackgroundGradientVerticalApp {
  BackgroundGradientDefaultApp({super.key, required Widget child})
      : super(
            child: child,
            initialColor: appColors.initialGradientColor,
            finalColor: appColors.finalGradientColor);
}

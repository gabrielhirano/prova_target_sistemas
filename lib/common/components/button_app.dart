import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget content;
  final Function() onTap;

  const ButtonApp(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.content,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}

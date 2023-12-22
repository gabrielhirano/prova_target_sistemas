import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextButtonApp({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final double? letterSpacing;
  final double? lineHeight;
  final Color? color;
  final FontWeight? weight;

  const TextWidget({
    required this.text,
    required this.size,
    this.letterSpacing,
    this.lineHeight,
    this.color = Colors.black,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: size,
          letterSpacing: letterSpacing,
          height: lineHeight,
          fontWeight: weight,
        ));
  }
}

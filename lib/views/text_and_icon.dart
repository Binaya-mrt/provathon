import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;
  final Color iconColor;

  IconAndText(
      {required this.icon,
      required this.iconColor,
      required this.size,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}

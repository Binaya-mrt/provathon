import 'package:flutter/material.dart';
import 'package:health_remit/views/text.dart';
import 'package:health_remit/views/text_and_icon.dart';

class Card1 extends StatelessWidget {
  final String Title1;
  final double sizeTitle1;
  final double height;
  final String address;

  Card1(
      {required this.Title1,
      required this.sizeTitle1,
      required this.height,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: Title1,
          size: sizeTitle1,
          weight: FontWeight.w700,
        ),
        SizedBox(
          height: height,
        ),
        TextWidget(
          text: address,
          size: 20,
          weight: FontWeight.w700,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Rating: '),
            Wrap(
              spacing: 0,
              children: List.generate(
                5,
                (int index) {
                  return const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.yellow,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // const TextWidget(text: '4.5', size: 14),
            const SizedBox(
              width: 10,
            ),
            const TextWidget(text: '1234 reviwes', size: 14),
          ],
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }
}

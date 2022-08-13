import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_remit/views/text.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 148.85;

  @override
  void initState() {
    setState(() {
      if (widget.text.length > textHeight) {
        firstHalf = widget.text.substring(
          0,
          textHeight.toInt(),
        );
        secondHalf =
            widget.text.substring(textHeight.toInt() + 1, widget.text.length);
      } else {
        firstHalf = widget.text;
        secondHalf = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: secondHalf.isEmpty
          ? TextWidget(text: firstHalf, size: 14)
          : Column(
              children: [
                TextWidget(
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf),
                    size: 14),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: const [
                        Text(
                          'See more',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 14,
                        ),
                      ],
                    ))
              ],
            ),
    );
  }
}

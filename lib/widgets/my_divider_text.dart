import 'package:flutter/material.dart';

import 'my_divider.dart';

class MyDivText extends StatelessWidget {
  final String text;
  final bool isThick;
  final bool isColored;

  const MyDivText({
    super.key,
    required this.text,
    this.isThick = false,
    this.isColored = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyDivider(
            isThick: isThick,
            isColored: isColored,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        Expanded(
          child: MyDivider(
            isThick: isThick,
            isColored: isColored,
          ),
        ),
      ],
    );
  }
}

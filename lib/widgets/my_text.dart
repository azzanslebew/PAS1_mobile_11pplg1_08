import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const MyText({
    super.key,
    required this.text,
    required this.textStyle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

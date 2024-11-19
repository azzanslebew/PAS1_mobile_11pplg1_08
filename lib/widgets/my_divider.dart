import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final bool isThick;
  final bool isColored;
  const MyDivider({super.key, required this.isThick, required this.isColored});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: isThick ? 1 : 0,
      color: isColored ? Colors.grey.shade300 : Colors.black,
    );
  }
}

import 'package:flutter/material.dart';

class MyNotifButton extends StatelessWidget {
  const MyNotifButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mic_none,
            color: Color(0xff404040),
          )),
    );
  }
}

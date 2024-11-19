import 'package:flutter/material.dart';

import 'my_notif_button.dart';
import 'my_search_bar.dart';

class MySearchNotif extends StatelessWidget {
  const MySearchNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: MySearchBar(),
        ),
        SizedBox(width: 8),
        MyNotifButton(),
      ],
    );
  }
}

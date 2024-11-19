import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showIcon;
  final double fontSize;
  final Color titleColor;

  const MyAppBar({
    super.key,
    required this.title,
    this.showIcon = true,
    required this.fontSize,
    this.titleColor = const Color(0xff404040),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: const Color(0xffF5F5F5),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          if (showIcon)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color(0xff404040),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

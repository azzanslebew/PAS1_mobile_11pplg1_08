import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xffE6E6E6)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xff404040)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Search for other club...',
                border: InputBorder.none,
                hintStyle: GoogleFonts.manrope(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
          ),
          const Icon(Icons.camera_alt_outlined, color: Color(0xff404040)),
        ],
      ),
    );
  }
}

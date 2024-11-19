import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/my_app_bar.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_confirm_dialog.dart';
import '../../widgets/my_list_item.dart';

class AccountViews extends StatelessWidget {
  const AccountViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const MyAppBar(
        title: 'My Account',
        fontSize: 26,
        showIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff156651),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://www.jordanharbinger.com/wp-content/uploads/2018/09/be-the-most-interesting.jpg',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'George James',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'george@gmail.com',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  MyListItem(icon: Icons.stadium_outlined, title: 'Stadium'),
                  MyListItem(
                    icon: Icons.schedule_outlined,
                    title: 'Match Schedules',
                  ),
                  MyListItem(
                      icon: Icons.airplane_ticket_outlined, title: 'Tickets'),
                  MyListItem(icon: Icons.payment, title: 'Payment Methods'),
                  MyListItem(
                      icon: Icons.notifications_outlined,
                      title: 'Notification'),
                  MyListItem(
                      icon: Icons.newspaper_outlined, title: 'Football News'),
                ],
              ),
              const SizedBox(height: 20),
              MyButton(
                onPressed: () {
                  MyConfirmDialog.show(
                    icon: Icons.error_outline_rounded,
                    title: "Log Out?",
                    message: "Are you sure you want to logout?",
                    confirmText: "Yes, Log Out",
                    cancelText: "No, Cancel",
                    onConfirm: () {
                      Get.offAllNamed('/login');
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                },
                category: 'Log Out',
                showBorder: false,
                textColor: Colors.white,
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

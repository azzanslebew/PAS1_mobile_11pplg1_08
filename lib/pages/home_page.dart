import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../widgets/my_bottom_nav.dart';
import 'views/account_views.dart';
import 'views/home_views.dart';
import 'views/wishlist_views.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> views = [
      const HomeViews(),
      const WishlistViews(),
      const AccountViews(),
    ];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: views[bottomNavController.selectedIndex.value],
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
        ),
      );
    });
  }
}

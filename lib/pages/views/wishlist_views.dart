import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas1_mobile_11pplg1_08/controllers/league_controller.dart';

import '../../widgets/my_app_bar.dart';
import '../../widgets/my_confirm_dialog.dart';

class WishlistViews extends StatelessWidget {
  const WishlistViews({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueController leagueController = Get.find<LeagueController>();

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Wishlist',
        fontSize: 26,
        showIcon: true,
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: Obx(() {
        if (leagueController.wishlist.isEmpty) {
          return Center(
            child: Text(
              'Your wishlist is empty',
              style: GoogleFonts.manrope(),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: leagueController.wishlist.length,
          itemBuilder: (context, index) {
            final league = leagueController.wishlist[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.grey.withOpacity(0.4),
              child: ListTile(
                leading: Image.network(
                  league.strBadge,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  league.strTeam,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(),
                ),
                subtitle: Text(
                  league.strLeague,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    MyConfirmDialog.show(
                      icon: Icons.remove_circle,
                      title: 'Delete Wishlist?',
                      message:
                          'Are you sure you want to remove this league from your wishlist?',
                      confirmText: 'Yes, Delete',
                      cancelText: 'No, Cancel',
                      onConfirm: () {
                        leagueController.toggleWishlist(league);
                        Get.back();
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

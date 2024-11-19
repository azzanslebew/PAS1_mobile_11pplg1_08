import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas1_mobile_11pplg1_08/controllers/league_controller.dart';
import 'package:pas1_mobile_11pplg1_08/models/league_model.dart';

class MyLeagueCard extends StatelessWidget {
  final LeagueModel leagueModel;
  final LeagueController leagueController;
  final VoidCallback onCardTap;

  const MyLeagueCard({
    super.key,
    required this.leagueModel,
    required this.leagueController,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                leagueModel.strBadge,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              leagueModel.strTeam,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              leagueModel.strLeague,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.bold,
                fontSize: 8,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xff156651),
                    ),
                    onPressed: onCardTap,
                    child: Text(
                      'Go to details',
                      style: GoogleFonts.manrope(
                          fontSize: 10, color: Colors.white),
                    )),
                GestureDetector(
                  onTap: () {
                    final wasWishlisted =
                        leagueController.isWishlisted(leagueModel);
                    leagueController.toggleWishlist(leagueModel);

                    if (!wasWishlisted) {
                      Get.snackbar(
                        "Success",
                        "Added to your wishlist",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: const Color(0xff156651),
                        colorText: Colors.white,
                        duration: const Duration(seconds: 1),
                      );
                    } else {
                      Get.snackbar(
                        "Removed",
                        "Removed from your wishlist",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 1),
                      );
                    }
                  },
                  child: Obx(() {
                    final isWishlisted =
                        leagueController.isWishlisted(leagueModel);
                    return Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color:
                          isWishlisted ? const Color(0xff156651) : Colors.grey,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

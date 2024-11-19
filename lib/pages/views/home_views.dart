import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_08/controllers/league_controller.dart';
import 'package:pas1_mobile_11pplg1_08/pages/detail_page.dart';
import 'package:pas1_mobile_11pplg1_08/widgets/my_app_bar.dart';
import 'package:pas1_mobile_11pplg1_08/widgets/my_league_card.dart';

import '../../widgets/my_search_notif.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueController leagueController = Get.put(LeagueController());

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const MyAppBar(title: 'Premier League', fontSize: 26),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySearchNotif(),
              const SizedBox(height: 16),
              Obx(() {
                if (leagueController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: leagueController.leagueList.length,
                  itemBuilder: (context, index) {
                    final leagueModel = leagueController.leagueList[index];
                    return MyLeagueCard(
                      leagueModel: leagueModel,
                      leagueController: leagueController,
                      onCardTap: () {
                        Get.to(DetailPage(
                            leagueModel: leagueModel,
                            leagueController: leagueController));
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

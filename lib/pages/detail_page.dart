import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas1_mobile_11pplg1_08/controllers/league_controller.dart';
import 'package:pas1_mobile_11pplg1_08/models/league_model.dart';
import 'package:pas1_mobile_11pplg1_08/widgets/my_app_bar.dart';

class DetailPage extends StatelessWidget {
  final LeagueModel leagueModel;
  final LeagueController leagueController;

  const DetailPage(
      {super.key, required this.leagueModel, required this.leagueController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const MyAppBar(
        title: 'Description',
        fontSize: 26,
        showIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  leagueModel.strBadge,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                leagueModel.strTeam,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                leagueModel.strDescriptionEN,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

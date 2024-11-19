import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_08/models/league_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/GET/api_service.dart';

class LeagueController extends GetxController {
  var isLoading = true.obs;
  var leagueList = <LeagueModel>[].obs;
  var wishlist = <LeagueModel>[].obs;

  @override
  void onInit() {
    fetchLeague();
    loadWishlist();
    super.onInit();
  }

  void fetchLeague() async {
    try {
      isLoading(true);
      var league = await ApiService().fetchLeague();
      leagueList.assignAll(league);
    } finally {
      isLoading(false);
    }
  }

  void toggleWishlist(LeagueModel leagueModel) async {
    if (wishlist.contains(leagueModel)) {
      wishlist.remove(leagueModel);
    } else {
      wishlist.add(leagueModel);
    }
    await saveWishlist();
  }

  bool isWishlisted(LeagueModel leagueModel) {
    return wishlist.contains(leagueModel);
  }

  Future<void> saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistJson =
        wishlist.map((leagueModel) => leagueModel.toJson()).toList();
    await prefs.setString('wishlist', jsonEncode(wishlistJson));
  }

  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistJson = prefs.getString('wishlist');

    if (wishlistJson != null) {
      final List<dynamic> decoded = jsonDecode(wishlistJson);
      wishlist.assignAll(
          decoded.map((data) => LeagueModel.fromJson(data)).toList());
    }
  }
}

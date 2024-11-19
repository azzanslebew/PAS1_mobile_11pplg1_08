import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_08/models/league_model.dart';

class ApiService {
  final String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3';

  Future<List<LeagueModel>> fetchLeague() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> teams = data['teams'];
      return teams.map((json) => LeagueModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class LeagueModel {
  final String idTeam;
  final String strTeam;
  final String strLeague;
  final String strBadge;
  final String strDescriptionEN;

  LeagueModel({
    required this.idTeam,
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
    this.strDescriptionEN = '',
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
        idTeam: json['idTeam'] ?? '',
        strTeam: json['strTeam'] ?? '',
        strLeague: json['strLeague'] ?? '',
        strBadge: json['strBadge'] ?? '',
        strDescriptionEN: json['strDescriptionEN'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strLeague': strLeague,
      'strBadge': strBadge,
      'strDescriptionEN': strDescriptionEN
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LeagueModel && other.idTeam == idTeam;
  }

  @override
  int get hashCode => idTeam.hashCode;
}

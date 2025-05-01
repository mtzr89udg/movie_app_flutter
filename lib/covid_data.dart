// lib/covid_data.dart
class CovidData {
  final int positive;
  final int hospitalized;

  CovidData({required this.positive, required this.hospitalized});

  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      positive: json['positive'] ?? 0,
      hospitalized: json['hospitalized'] ?? 0,
    );
  }
}


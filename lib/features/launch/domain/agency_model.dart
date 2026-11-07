final class AgencyModel {
  const AgencyModel({
    required this.id,
    required this.name,
    required this.type,
    required this.countryCode,
    required this.foundingYear,
    required this.totalLaunchCount,
  });

  final int id;
  final String name;
  final String type;
  final String countryCode;
  final int? foundingYear;
  final int totalLaunchCount;
}

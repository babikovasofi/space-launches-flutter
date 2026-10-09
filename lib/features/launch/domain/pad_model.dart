import 'package:space_launches/features/launch/domain/launch_model.dart';

final class PadModel {
  const PadModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.countryCode,
    required this.totalLaunchCount,
  });

  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final PadLocationModel location;
  final String countryCode;
  final int totalLaunchCount;
}

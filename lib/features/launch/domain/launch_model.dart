final class LaunchModel {
  const LaunchModel({
    required this.id,
    required this.name,
    required this.status,
    required this.net,
    required this.provider,
    required this.rocket,
    required this.mission,
    required this.pad,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final LaunchStatusModel status;
  final String net;
  final LaunchProviderModel provider;
  final RocketConfigurationModel rocket;
  final MissionModel? mission;
  final LaunchPadModel pad;
  final String imageUrl;
}

final class LaunchStatusModel {
  const LaunchStatusModel({
    required this.id,
    required this.name,
    required this.abbrev,
    required this.description,
  });

  final int id;
  final String name;
  final String abbrev;
  final String description;
}

final class LaunchProviderModel {
  const LaunchProviderModel({
    required this.id,
    required this.name,
    required this.type,
  });

  final int id;
  final String name;
  final String type;
}

final class RocketConfigurationModel {
  const RocketConfigurationModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.variant,
  });

  final int id;
  final String name;
  final String fullName;
  final String variant;
}

final class MissionModel {
  const MissionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.orbit,
  });

  final int id;
  final String name;
  final String description;
  final String type;
  final OrbitModel? orbit;
}

final class OrbitModel {
  const OrbitModel({required this.name, required this.abbrev});

  final String name;
  final String abbrev;
}

final class LaunchPadModel {
  const LaunchPadModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.location,
  });

  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final PadLocationModel location;
}

final class PadLocationModel {
  const PadLocationModel({
    required this.id,
    required this.name,
    required this.countryCode,
  });

  final int id;
  final String name;
  final String countryCode;
}

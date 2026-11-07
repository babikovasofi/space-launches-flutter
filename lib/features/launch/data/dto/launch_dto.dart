import 'package:json_annotation/json_annotation.dart';
import 'package:space_launches/features/launch/data/dto/pad_dto.dart';

part 'launch_dto.g.dart';

@JsonSerializable()
class LaunchDto {
  const LaunchDto({
    required this.id,
    required this.name,
    required this.status,
    required this.net,
    required this.launchServiceProvider,
    required this.rocket,
    required this.mission,
    required this.pad,
    required this.image,
  });

  factory LaunchDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchDtoFromJson(json);

  final String id;
  final String name;
  final LaunchStatusDto status;
  final String net;

  @JsonKey(name: 'launch_service_provider')
  final LaunchProviderDto launchServiceProvider;

  final RocketDto rocket;
  final MissionDto? mission;
  final LaunchPadDto pad;
  final String? image;
}

@JsonSerializable()
class LaunchStatusDto {
  const LaunchStatusDto({
    required this.id,
    required this.name,
    required this.abbrev,
    required this.description,
  });

  factory LaunchStatusDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchStatusDtoFromJson(json);

  final int id;
  final String name;
  final String abbrev;
  final String description;
}

@JsonSerializable()
class LaunchProviderDto {
  const LaunchProviderDto({
    required this.id,
    required this.name,
    required this.type,
  });

  factory LaunchProviderDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchProviderDtoFromJson(json);

  final int id;
  final String name;
  final String type;
}

@JsonSerializable()
class RocketDto {
  const RocketDto({required this.configuration});

  factory RocketDto.fromJson(Map<String, dynamic> json) =>
      _$RocketDtoFromJson(json);

  final RocketConfigurationDto configuration;
}

@JsonSerializable()
class RocketConfigurationDto {
  const RocketConfigurationDto({
    required this.id,
    required this.name,
    required this.fullName,
    required this.variant,
  });

  factory RocketConfigurationDto.fromJson(Map<String, dynamic> json) =>
      _$RocketConfigurationDtoFromJson(json);

  final int id;
  final String name;

  @JsonKey(name: 'full_name')
  final String fullName;

  final String variant;
}

@JsonSerializable()
class MissionDto {
  const MissionDto({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.orbit,
  });

  factory MissionDto.fromJson(Map<String, dynamic> json) =>
      _$MissionDtoFromJson(json);

  final int id;
  final String name;
  final String description;
  final String type;
  final OrbitDto? orbit;
}

@JsonSerializable()
class OrbitDto {
  const OrbitDto({required this.name, required this.abbrev});

  factory OrbitDto.fromJson(Map<String, dynamic> json) =>
      _$OrbitDtoFromJson(json);

  final String name;
  final String abbrev;
}

@JsonSerializable()
class LaunchPadDto {
  const LaunchPadDto({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.location,
  });

  factory LaunchPadDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchPadDtoFromJson(json);

  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final PadLocationDto location;
}

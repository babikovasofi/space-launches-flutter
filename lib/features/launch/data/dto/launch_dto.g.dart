// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchDto _$LaunchDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LaunchDto', json, ($checkedConvert) {
      final val = LaunchDto(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => LaunchStatusDto.fromJson(v as Map<String, dynamic>),
        ),
        net: $checkedConvert('net', (v) => v as String),
        launchServiceProvider: $checkedConvert(
          'launch_service_provider',
          (v) => LaunchProviderDto.fromJson(v as Map<String, dynamic>),
        ),
        rocket: $checkedConvert(
          'rocket',
          (v) => RocketDto.fromJson(v as Map<String, dynamic>),
        ),
        mission: $checkedConvert(
          'mission',
          (v) =>
              v == null ? null : MissionDto.fromJson(v as Map<String, dynamic>),
        ),
        pad: $checkedConvert(
          'pad',
          (v) => LaunchPadDto.fromJson(v as Map<String, dynamic>),
        ),
        image: $checkedConvert('image', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'launchServiceProvider': 'launch_service_provider'});

LaunchStatusDto _$LaunchStatusDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LaunchStatusDto', json, ($checkedConvert) {
      final val = LaunchStatusDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        abbrev: $checkedConvert('abbrev', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

LaunchProviderDto _$LaunchProviderDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LaunchProviderDto', json, ($checkedConvert) {
      final val = LaunchProviderDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    });

RocketDto _$RocketDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RocketDto', json, ($checkedConvert) {
      final val = RocketDto(
        configuration: $checkedConvert(
          'configuration',
          (v) => RocketConfigurationDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

RocketConfigurationDto _$RocketConfigurationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RocketConfigurationDto', json, ($checkedConvert) {
  final val = RocketConfigurationDto(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    fullName: $checkedConvert('full_name', (v) => v as String),
    variant: $checkedConvert('variant', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'fullName': 'full_name'});

MissionDto _$MissionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MissionDto', json, ($checkedConvert) {
      final val = MissionDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
        orbit: $checkedConvert(
          'orbit',
          (v) =>
              v == null ? null : OrbitDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

OrbitDto _$OrbitDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrbitDto', json, ($checkedConvert) {
      final val = OrbitDto(
        name: $checkedConvert('name', (v) => v as String),
        abbrev: $checkedConvert('abbrev', (v) => v as String),
      );
      return val;
    });

LaunchPadDto _$LaunchPadDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LaunchPadDto', json, ($checkedConvert) {
      final val = LaunchPadDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        latitude: $checkedConvert('latitude', (v) => v as String),
        longitude: $checkedConvert('longitude', (v) => v as String),
        location: $checkedConvert(
          'location',
          (v) => PadLocationDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

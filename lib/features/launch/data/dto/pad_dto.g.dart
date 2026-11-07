// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pad_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PadDto _$PadDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PadDto',
  json,
  ($checkedConvert) {
    final val = PadDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      latitude: $checkedConvert('latitude', (v) => v as String),
      longitude: $checkedConvert('longitude', (v) => v as String),
      location: $checkedConvert(
        'location',
        (v) => PadLocationDto.fromJson(v as Map<String, dynamic>),
      ),
      countryCode: $checkedConvert('country_code', (v) => v as String),
      totalLaunchCount: $checkedConvert(
        'total_launch_count',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'countryCode': 'country_code',
    'totalLaunchCount': 'total_launch_count',
  },
);

PadLocationDto _$PadLocationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PadLocationDto', json, ($checkedConvert) {
      final val = PadLocationDto(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        countryCode: $checkedConvert('country_code', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'countryCode': 'country_code'});

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyDto _$AgencyDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AgencyDto',
  json,
  ($checkedConvert) {
    final val = AgencyDto(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      type: $checkedConvert('type', (v) => v as String),
      countryCode: $checkedConvert('country_code', (v) => v as String),
      foundingYear: $checkedConvert('founding_year', (v) => v as String?),
      totalLaunchCount: $checkedConvert(
        'total_launch_count',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'countryCode': 'country_code',
    'foundingYear': 'founding_year',
    'totalLaunchCount': 'total_launch_count',
  },
);

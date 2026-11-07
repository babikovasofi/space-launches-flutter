import 'package:json_annotation/json_annotation.dart';

part 'pad_dto.g.dart';

@JsonSerializable()
class PadDto {
  const PadDto({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.countryCode,
    required this.totalLaunchCount,
  });

  factory PadDto.fromJson(Map<String, dynamic> json) => _$PadDtoFromJson(json);

  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final PadLocationDto location;

  @JsonKey(name: 'country_code')
  final String countryCode;

  @JsonKey(name: 'total_launch_count')
  final int totalLaunchCount;
}

@JsonSerializable()
class PadLocationDto {
  const PadLocationDto({
    required this.id,
    required this.name,
    required this.countryCode,
  });

  factory PadLocationDto.fromJson(Map<String, dynamic> json) =>
      _$PadLocationDtoFromJson(json);

  final int id;
  final String name;

  @JsonKey(name: 'country_code')
  final String countryCode;
}

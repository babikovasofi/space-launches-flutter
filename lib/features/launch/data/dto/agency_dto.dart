import 'package:json_annotation/json_annotation.dart';

part 'agency_dto.g.dart';

@JsonSerializable()
class AgencyDto {
  const AgencyDto({
    required this.id,
    required this.name,
    required this.type,
    required this.countryCode,
    required this.foundingYear,
    required this.totalLaunchCount,
  });

  factory AgencyDto.fromJson(Map<String, dynamic> json) =>
      _$AgencyDtoFromJson(json);

  final int id;
  final String name;
  final String type;

  @JsonKey(name: 'country_code')
  final String countryCode;

  @JsonKey(name: 'founding_year')
  final String? foundingYear;

  @JsonKey(name: 'total_launch_count')
  final int totalLaunchCount;
}

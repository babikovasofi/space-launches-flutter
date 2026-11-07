import 'package:json_annotation/json_annotation.dart';
import 'package:space_launches/features/launch/data/dto/launch_dto.dart';

part 'launch_page_dto.g.dart';

@JsonSerializable()
class LaunchPageDto {
  const LaunchPageDto({required this.results});

  factory LaunchPageDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchPageDtoFromJson(json);

  final List<LaunchDto> results;
}

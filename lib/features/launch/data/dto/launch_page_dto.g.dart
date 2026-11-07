// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPageDto _$LaunchPageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LaunchPageDto', json, ($checkedConvert) {
      final val = LaunchPageDto(
        results: $checkedConvert(
          'results',
          (v) => (v as List<dynamic>)
              .map((e) => LaunchDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

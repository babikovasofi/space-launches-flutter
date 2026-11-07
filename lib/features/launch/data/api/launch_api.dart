import 'package:dio/dio.dart';
import 'package:space_launches/features/launch/data/dto/agency_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_page_dto.dart';
import 'package:space_launches/features/launch/data/dto/pad_dto.dart';

final class LaunchApi {
  const LaunchApi(this._dio);

  final Dio _dio;

  Future<LaunchPageDto> getLaunches({
    required int offset,
    required int limit,
    String? search,
  }) async => LaunchPageDto.fromJson(
    await _getJson(
      '/launch/',
      queryParameters: {'offset': offset, 'limit': limit, 'search': ?search},
    ),
  );

  Future<LaunchDto> getLaunch(String id) async =>
      LaunchDto.fromJson(await _getJson('/launch/$id/'));

  Future<AgencyDto> getAgency(int id) async =>
      AgencyDto.fromJson(await _getJson('/agencies/$id/'));

  Future<PadDto> getPad(int id) async =>
      PadDto.fromJson(await _getJson('/pad/$id/'));

  Future<Map<String, dynamic>> _getJson(
    String path, {
    Map<String, Object>? queryParameters,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return response.data ?? (throw const FormatException('Empty response'));
  }
}

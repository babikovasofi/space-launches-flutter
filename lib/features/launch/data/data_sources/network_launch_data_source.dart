import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/data/api/launch_api.dart';
import 'package:space_launches/features/launch/data/data_sources/i_launch_data_source.dart';
import 'package:space_launches/features/launch/data/dto/agency_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_page_dto.dart';
import 'package:space_launches/features/launch/data/dto/pad_dto.dart';

final class NetworkLaunchDataSource implements ILaunchDataSource {
  const NetworkLaunchDataSource(this._api);

  final LaunchApi _api;

  @override
  Future<LaunchPageDto> getLaunches({
    required int offset,
    required int limit,
    String? search,
  }) => _guard(
    () => _api.getLaunches(offset: offset, limit: limit, search: search),
  );

  @override
  Future<LaunchDto> getLaunch(String id) => _guard(() => _api.getLaunch(id));

  @override
  Future<AgencyDto> getAgency(int id) => _guard(() => _api.getAgency(id));

  @override
  Future<PadDto> getPad(int id) => _guard(() => _api.getPad(id));

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw _fromDio(error);
    } on CheckedFromJsonException {
      throw const BadResponseException();
    } on FormatException {
      throw const BadResponseException();
    }
  }

  LoadException _fromDio(DioException error) => switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => const TimeoutLoadException(),
    DioExceptionType.badResponse when error.response?.statusCode == 404 =>
      const NotFoundException(),
    DioExceptionType.badResponse => const ServerException(),
    DioExceptionType.unknown when error.error is FormatException =>
      const BadResponseException(),
    DioExceptionType.connectionError ||
    DioExceptionType.badCertificate ||
    DioExceptionType.cancel ||
    DioExceptionType.unknown => const NoConnectionException(),
  };
}

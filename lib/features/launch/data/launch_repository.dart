import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/data/data_sources/i_launch_data_source.dart';
import 'package:space_launches/features/launch/data/mappers/launch_mapper.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';

final class LaunchRepository implements ILaunchRepository {
  const LaunchRepository(this._dataSource);

  final ILaunchDataSource _dataSource;

  @override
  Future<List<LaunchModel>> getLaunches({
    required int offset,
    required int limit,
  }) => _loadLaunches(offset: offset, limit: limit);

  @override
  Future<List<LaunchModel>> searchLaunches(
    String query, {
    required int offset,
    required int limit,
  }) {
    final needle = query.trim();
    return _loadLaunches(
      offset: offset,
      limit: limit,
      search: needle.isEmpty ? null : needle,
    );
  }

  @override
  Future<LaunchModel?> getLaunch(String id) =>
      _nullIfNotFound(() async => (await _dataSource.getLaunch(id)).toModel());

  @override
  Future<AgencyModel?> getAgency(int id) =>
      _nullIfNotFound(() async => (await _dataSource.getAgency(id)).toModel());

  @override
  Future<PadModel?> getPad(int id) =>
      _nullIfNotFound(() async => (await _dataSource.getPad(id)).toModel());

  Future<List<LaunchModel>> _loadLaunches({
    required int offset,
    required int limit,
    String? search,
  }) async {
    final page = await _dataSource.getLaunches(
      offset: offset,
      limit: limit,
      search: search,
    );
    return [for (final dto in page.results) dto.toModel()];
  }

  Future<T?> _nullIfNotFound<T>(Future<T> Function() load) async {
    try {
      return await load();
    } on NotFoundException {
      return null;
    }
  }
}

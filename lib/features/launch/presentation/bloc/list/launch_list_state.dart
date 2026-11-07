import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';

sealed class LaunchListState {
  const LaunchListState({required this.query});

  final String query;
}

final class LaunchListLoading extends LaunchListState {
  const LaunchListLoading({required super.query});
}

final class LaunchListLoaded extends LaunchListState {
  const LaunchListLoaded({required super.query, required this.items});

  final List<LaunchModel> items;
}

final class LaunchListFailure extends LaunchListState {
  const LaunchListFailure({required super.query, required this.error});

  final LoadException error;
}

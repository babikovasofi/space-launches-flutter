import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_event.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  LaunchListBloc(this._repository) : super(const LaunchListLoading(query: '')) {
    on<LaunchListEvent>(_onEvent, transformer: restartable());
  }

  final ILaunchRepository _repository;

  Future<void> _onEvent(
    LaunchListEvent event,
    Emitter<LaunchListState> emit,
  ) async {
    final query = switch (event) {
      LaunchListStarted() => '',
      LaunchListQueryChanged(:final query) => query,
      LaunchListRetried() => state.query,
    };
    emit(LaunchListLoading(query: query));
    try {
      final items = query.isEmpty
          ? await _repository.getLaunches()
          : await _repository.searchLaunches(query);
      emit(LaunchListLoaded(query: query, items: items));
    } on LoadException catch (error) {
      emit(LaunchListFailure(query: query, error: error));
    }
  }
}

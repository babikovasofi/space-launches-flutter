import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_event.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  LaunchListBloc(this._repository) : super(const LaunchListState()) {
    on<LaunchListStarted>(_onStarted);
    // Each new query cancels the previous search, so a slow stale
    // response can never overwrite the result of a newer query.
    on<LaunchListQueryChanged>(_onQueryChanged, transformer: restartable());
  }

  final ILaunchRepository _repository;

  Future<void> _onStarted(
    LaunchListStarted event,
    Emitter<LaunchListState> emit,
  ) async {
    final items = await _repository.getLaunches();
    emit(state.copyWith(items: items));
  }

  Future<void> _onQueryChanged(
    LaunchListQueryChanged event,
    Emitter<LaunchListState> emit,
  ) async {
    emit(state.copyWith(query: event.query));
    final items = await _repository.searchLaunches(event.query);
    emit(state.copyWith(items: items));
  }
}

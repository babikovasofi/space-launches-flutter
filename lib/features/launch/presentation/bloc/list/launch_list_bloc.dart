import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_event.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  LaunchListBloc(this._repository) : super(const LaunchListLoading(query: '')) {
    on<LaunchListFirstPageEvent>(_onFirstPage, transformer: restartable());
    on<LaunchListNextPageRequested>(_onNextPage, transformer: droppable());
  }

  final ILaunchRepository _repository;

  static const int _pageSize = 20;

  Future<void> _onFirstPage(
    LaunchListFirstPageEvent event,
    Emitter<LaunchListState> emit,
  ) async {
    final query = switch (event) {
      LaunchListStarted() => '',
      LaunchListQueryChanged(:final query) => query,
      LaunchListRetried() => state.query,
    };
    emit(LaunchListLoading(query: query));
    try {
      final items = await _fetch(query, offset: 0);
      emit(
        LaunchListLoaded(
          query: query,
          items: items,
          hasMore: items.length == _pageSize,
        ),
      );
    } on LoadException catch (error) {
      emit(LaunchListFailure(query: query, error: error));
    }
  }

  Future<void> _onNextPage(
    LaunchListNextPageRequested event,
    Emitter<LaunchListState> emit,
  ) async {
    final current = state;
    if (current is! LaunchListLoaded ||
        !current.hasMore ||
        current.isLoadingMore) {
      return;
    }
    final loading = LaunchListLoaded(
      query: current.query,
      items: current.items,
      hasMore: true,
      isLoadingMore: true,
    );
    emit(loading);
    try {
      final next = await _fetch(current.query, offset: current.items.length);
      if (state != loading) return;
      emit(
        LaunchListLoaded(
          query: current.query,
          items: [...current.items, ...next],
          hasMore: next.length == _pageSize,
        ),
      );
    } on LoadException catch (error) {
      if (state != loading) return;
      emit(
        LaunchListLoaded(
          query: current.query,
          items: current.items,
          hasMore: true,
          loadMoreError: error,
        ),
      );
    }
  }

  Future<List<LaunchModel>> _fetch(String query, {required int offset}) =>
      query.isEmpty
      ? _repository.getLaunches(offset: offset, limit: _pageSize)
      : _repository.searchLaunches(query, offset: offset, limit: _pageSize);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';

class LaunchListCubit extends Cubit<LaunchListState> {
  LaunchListCubit(this._repository) : super(const LaunchListState());

  final ILaunchRepository _repository;

  Future<void> load() async {
    final items = await _repository.getLaunches();
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }

  Future<void> search(String query) async {
    emit(state.copyWith(query: query));
    final items = await _repository.searchLaunches(query);
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }
}

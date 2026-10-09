import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_event.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_state.dart';

class LaunchDetailBloc extends Bloc<LaunchDetailEvent, LaunchDetailState> {
  LaunchDetailBloc(this._repository) : super(const LaunchDetailLoading()) {
    on<LaunchDetailOpened>(_onOpened);
  }

  final ILaunchRepository _repository;

  Future<void> _onOpened(
    LaunchDetailOpened event,
    Emitter<LaunchDetailState> emit,
  ) async {
    final launch = await _repository.getLaunch(event.id);
    if (launch == null) {
      emit(LaunchDetailNotFound(event.id));
      return;
    }
    emit(LaunchDetailLoaded(launch));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_state.dart';

class LaunchDetailCubit extends Cubit<LaunchDetailState> {
  LaunchDetailCubit(this._repository) : super(const LaunchDetailLoading());

  final ILaunchRepository _repository;

  Future<void> load(String id) async {
    emit(const LaunchDetailLoading());
    try {
      final launch = await _repository.getLaunch(id);
      if (isClosed) return;
      emit(
        launch == null ? LaunchDetailNotFound(id) : LaunchDetailLoaded(launch),
      );
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(LaunchDetailFailure(error));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/pad/pad_state.dart';

class PadCubit extends Cubit<PadState> {
  PadCubit(this._repository) : super(const PadLoading());

  final ILaunchRepository _repository;

  Future<void> load(int id) async {
    final pad = await _repository.getPad(id);
    if (isClosed) return;
    emit(pad == null ? PadNotFound(id) : PadLoaded(pad));
  }
}

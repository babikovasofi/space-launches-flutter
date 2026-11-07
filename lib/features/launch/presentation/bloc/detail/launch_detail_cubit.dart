import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_state.dart';

class LaunchDetailCubit extends Cubit<LaunchDetailState> {
  LaunchDetailCubit(this._repository) : super(const LaunchDetailLoading());

  final ILaunchRepository _repository;

  Future<void> load(String id) async {
    emit(const LaunchDetailLoading());
    try {
      final launch = await _repository.getLaunch(id);
      if (isClosed) return;
      if (launch == null) {
        emit(LaunchDetailNotFound(id));
        return;
      }
      final (agency, pad) = await _loadRelated(launch);
      if (isClosed) return;
      emit(LaunchDetailLoaded(launch, agency: agency, pad: pad));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(LaunchDetailFailure(error));
    }
  }

  Future<(AgencyModel?, PadModel?)> _loadRelated(LaunchModel launch) async {
    try {
      return await (
        _repository.getAgency(launch.provider.id),
        _repository.getPad(launch.pad.id),
      ).wait;
    } on ParallelWaitError<
      (AgencyModel?, PadModel?),
      (AsyncError?, AsyncError?)
    > catch (error) {
      final first = (error.errors.$1 ?? error.errors.$2)!;
      Error.throwWithStackTrace(first.error, first.stackTrace);
    }
  }
}

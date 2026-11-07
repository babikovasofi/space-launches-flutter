import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/agency/agency_state.dart';

class AgencyCubit extends Cubit<AgencyState> {
  AgencyCubit(this._repository) : super(const AgencyLoading());

  final ILaunchRepository _repository;

  Future<void> load(int id) async {
    final agency = await _repository.getAgency(id);
    if (isClosed) return;
    emit(agency == null ? AgencyNotFound(id) : AgencyLoaded(agency));
  }
}

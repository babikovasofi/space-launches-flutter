import 'package:space_launches/features/launch/domain/agency_model.dart';

sealed class AgencyState {
  const AgencyState();
}

final class AgencyLoading extends AgencyState {
  const AgencyLoading();
}

final class AgencyLoaded extends AgencyState {
  const AgencyLoaded(this.agency);

  final AgencyModel agency;
}

final class AgencyNotFound extends AgencyState {
  const AgencyNotFound(this.id);

  final int id;
}

import 'package:space_launches/common/network/load_exception.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';

sealed class LaunchDetailState {
  const LaunchDetailState();
}

final class LaunchDetailLoading extends LaunchDetailState {
  const LaunchDetailLoading();
}

final class LaunchDetailLoaded extends LaunchDetailState {
  const LaunchDetailLoaded(
    this.launch, {
    required this.agency,
    required this.pad,
  });

  final LaunchModel launch;
  final AgencyModel? agency;
  final PadModel? pad;
}

final class LaunchDetailNotFound extends LaunchDetailState {
  const LaunchDetailNotFound(this.id);

  final String id;
}

final class LaunchDetailFailure extends LaunchDetailState {
  const LaunchDetailFailure(this.error);

  final LoadException error;
}

import 'package:space_launches/features/launch/domain/launch_model.dart';

sealed class LaunchDetailState {
  const LaunchDetailState();
}

final class LaunchDetailLoading extends LaunchDetailState {
  const LaunchDetailLoading();
}

final class LaunchDetailLoaded extends LaunchDetailState {
  const LaunchDetailLoaded(this.launch);

  final LaunchModel launch;
}

final class LaunchDetailNotFound extends LaunchDetailState {
  const LaunchDetailNotFound(this.id);

  final String id;
}

sealed class LaunchDetailEvent {
  const LaunchDetailEvent();
}

final class LaunchDetailOpened extends LaunchDetailEvent {
  const LaunchDetailOpened(this.id);

  final String id;
}

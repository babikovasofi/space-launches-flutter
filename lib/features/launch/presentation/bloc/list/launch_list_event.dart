sealed class LaunchListEvent {
  const LaunchListEvent();
}

final class LaunchListStarted extends LaunchListEvent {
  const LaunchListStarted();
}

final class LaunchListQueryChanged extends LaunchListEvent {
  const LaunchListQueryChanged(this.query);

  final String query;
}

final class LaunchListRetried extends LaunchListEvent {
  const LaunchListRetried();
}

sealed class LaunchListEvent {
  const LaunchListEvent();
}

sealed class LaunchListFirstPageEvent extends LaunchListEvent {
  const LaunchListFirstPageEvent();
}

final class LaunchListStarted extends LaunchListFirstPageEvent {
  const LaunchListStarted();
}

final class LaunchListQueryChanged extends LaunchListFirstPageEvent {
  const LaunchListQueryChanged(this.query);

  final String query;
}

final class LaunchListRetried extends LaunchListFirstPageEvent {
  const LaunchListRetried();
}

sealed class LaunchListNextPageEvent extends LaunchListEvent {
  const LaunchListNextPageEvent();
}

final class LaunchListNextPageRequested extends LaunchListNextPageEvent {
  const LaunchListNextPageRequested();
}

final class LaunchListNextPageRetried extends LaunchListNextPageEvent {
  const LaunchListNextPageRetried();
}

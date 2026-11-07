import 'package:space_launches/features/launch/domain/launch_model.dart';

final class LaunchListState {
  const LaunchListState({this.query = '', this.items = const []});

  final String query;
  final List<LaunchModel> items;

  LaunchListState copyWith({String? query, List<LaunchModel>? items}) =>
      LaunchListState(query: query ?? this.query, items: items ?? this.items);
}

import 'package:space_launches/features/launch/domain/launch_model.dart';

extension LaunchFormat on LaunchModel {
  String get launchTime {
    final date = net.split('T').first.split('-');
    if (date.length != 3) return net;
    final time = net.split('T').last.substring(0, 5);
    return '${date[2]}.${date[1]}.${date[0]} $time UTC';
  }
}

extension OrbitFormat on OrbitModel {
  String get display => '$name ($abbrev)';
}

import 'package:space_launches/features/launch/data/mock_agencies.dart';
import 'package:space_launches/features/launch/data/mock_launches.dart';
import 'package:space_launches/features/launch/data/mock_pads.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';

final class LaunchRepository implements ILaunchRepository {
  const LaunchRepository();

  @override
  Future<List<LaunchModel>> getLaunches() async => mockLaunches;

  @override
  Future<List<LaunchModel>> searchLaunches(String query) async {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return mockLaunches;
    return [
      for (final launch in mockLaunches)
        if (launch.name.toLowerCase().contains(needle)) launch,
    ];
  }

  @override
  Future<LaunchModel?> getLaunch(String id) async {
    for (final launch in mockLaunches) {
      if (launch.id == id) return launch;
    }
    return null;
  }

  @override
  Future<AgencyModel?> getAgency(int id) async {
    for (final agency in mockAgencies) {
      if (agency.id == id) return agency;
    }
    return null;
  }

  @override
  Future<PadModel?> getPad(int id) async {
    for (final pad in mockPads) {
      if (pad.id == id) return pad;
    }
    return null;
  }
}

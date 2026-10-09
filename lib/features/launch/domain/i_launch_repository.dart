import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';

abstract interface class ILaunchRepository {
  Future<List<LaunchModel>> getLaunches();

  Future<List<LaunchModel>> searchLaunches(String query);

  Future<LaunchModel?> getLaunch(String id);

  Future<AgencyModel?> getAgency(int id);

  Future<PadModel?> getPad(int id);
}

import 'package:space_launches/features/launch/data/dto/agency_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_page_dto.dart';
import 'package:space_launches/features/launch/data/dto/pad_dto.dart';

abstract interface class ILaunchDataSource {
  Future<LaunchPageDto> getLaunches({
    required int offset,
    required int limit,
    String? search,
  });

  Future<LaunchDto> getLaunch(String id);

  Future<AgencyDto> getAgency(int id);

  Future<PadDto> getPad(int id);
}

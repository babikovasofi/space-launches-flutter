import 'package:space_launches/features/launch/data/dto/agency_dto.dart';
import 'package:space_launches/features/launch/data/dto/launch_dto.dart';
import 'package:space_launches/features/launch/data/dto/pad_dto.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';

extension LaunchDtoMapper on LaunchDto {
  LaunchModel toModel() => LaunchModel(
    id: id,
    name: name,
    status: LaunchStatusModel(
      id: status.id,
      name: status.name,
      abbrev: status.abbrev,
      description: status.description,
    ),
    net: net,
    provider: LaunchProviderModel(
      id: launchServiceProvider.id,
      name: launchServiceProvider.name,
      type: launchServiceProvider.type,
    ),
    rocket: RocketConfigurationModel(
      id: rocket.configuration.id,
      name: rocket.configuration.name,
      fullName: rocket.configuration.fullName,
      variant: rocket.configuration.variant,
    ),
    mission: mission?.toModel(),
    pad: LaunchPadModel(
      id: pad.id,
      name: pad.name,
      latitude: pad.latitude,
      longitude: pad.longitude,
      location: pad.location.toModel(),
    ),
    imageUrl: image,
  );
}

extension MissionDtoMapper on MissionDto {
  MissionModel toModel() => MissionModel(
    id: id,
    name: name,
    description: description,
    type: type,
    orbit: orbit?.toModel(),
  );
}

extension OrbitDtoMapper on OrbitDto {
  OrbitModel toModel() => OrbitModel(name: name, abbrev: abbrev);
}

extension AgencyDtoMapper on AgencyDto {
  AgencyModel toModel() => AgencyModel(
    id: id,
    name: name,
    type: type,
    countryCode: countryCode,
    foundingYear: int.tryParse(foundingYear ?? ''),
    totalLaunchCount: totalLaunchCount,
  );
}

extension PadDtoMapper on PadDto {
  PadModel toModel() => PadModel(
    id: id,
    name: name,
    latitude: latitude,
    longitude: longitude,
    location: location.toModel(),
    countryCode: countryCode,
    totalLaunchCount: totalLaunchCount,
  );
}

extension PadLocationDtoMapper on PadLocationDto {
  PadLocationModel toModel() =>
      PadLocationModel(id: id, name: name, countryCode: countryCode);
}

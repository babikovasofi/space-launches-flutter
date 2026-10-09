import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_launches/common/navigation/app_router.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_bloc.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_event.dart';
import 'package:space_launches/features/launch/presentation/bloc/detail/launch_detail_state.dart';
import 'package:space_launches/features/launch/presentation/utils/launch_format.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/card_surface.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/fact_row.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/link_row.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/status_chip.dart';
import 'package:space_launches/l10n/app_localizations.dart';

class LaunchDetailScreen extends StatelessWidget {
  const LaunchDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LaunchDetailBloc(context.read<ILaunchRepository>())
            ..add(LaunchDetailOpened(id)),
      child: AppScaffold(
        body: BlocBuilder<LaunchDetailBloc, LaunchDetailState>(
          builder: (context, state) => switch (state) {
            LaunchDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            LaunchDetailNotFound(:final id) => Center(
              child: Text(AppLocalizations.of(context).detailNotFound(id)),
            ),
            LaunchDetailLoaded(:final launch) => _DetailContent(launch: launch),
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.launch});

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final mission = launch.mission;
    final orbit = mission?.orbit;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  launch.rocketImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text(launch.name, style: theme.textTheme.headlineSmall),
              StatusChip(statusName: launch.status.name),
              Text(
                launch.status.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              CardSurface(
                child: Column(
                  spacing: 8,
                  children: [
                    FactRow(label: l10n.detailNet, value: launch.launchTime),
                    FactRow(
                      label: l10n.detailRocket,
                      value: launch.rocket.fullName,
                    ),
                  ],
                ),
              ),
              if (mission != null)
                CardSurface(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        l10n.detailMission,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(mission.name, style: theme.textTheme.bodyLarge),
                      FactRow(
                        label: l10n.detailMissionType,
                        value: mission.type,
                      ),
                      if (orbit != null)
                        FactRow(label: l10n.detailOrbit, value: orbit.display),
                      Text(
                        mission.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              LinkRow(
                label: l10n.detailProvider,
                value: launch.provider.name,
                onTap: () => context.push(AppRoutes.agency(launch.provider.id)),
              ),
              LinkRow(
                label: l10n.detailPad,
                value: launch.pad.name,
                onTap: () => context.push(AppRoutes.pad(launch.pad.id)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

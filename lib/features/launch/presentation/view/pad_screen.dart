import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/domain/pad_model.dart';
import 'package:space_launches/features/launch/presentation/bloc/pad/pad_cubit.dart';
import 'package:space_launches/features/launch/presentation/bloc/pad/pad_state.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/card_surface.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/fact_row.dart';
import 'package:space_launches/l10n/app_localizations.dart';

class PadScreen extends StatelessWidget {
  const PadScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PadCubit(context.read<ILaunchRepository>())..load(id),
      child: AppScaffold(
        body: BlocBuilder<PadCubit, PadState>(
          builder: (context, state) => switch (state) {
            PadLoading() => const Center(child: CircularProgressIndicator()),
            PadNotFound(:final id) => Center(
              child: Text(
                AppLocalizations.of(context).detailNotFound(id.toString()),
              ),
            ),
            PadLoaded(:final pad) => _PadContent(pad: pad),
          },
        ),
      ),
    );
  }
}

class _PadContent extends StatelessWidget {
  const _PadContent({required this.pad});

  final PadModel pad;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(pad.name, style: Theme.of(context).textTheme.headlineSmall),
              CardSurface(
                child: Column(
                  spacing: 8,
                  children: [
                    FactRow(label: l10n.padLocation, value: pad.location.name),
                    FactRow(label: l10n.padCountry, value: pad.countryCode),
                    FactRow(
                      label: l10n.padCoordinates,
                      value: '${pad.latitude}, ${pad.longitude}',
                    ),
                    FactRow(
                      label: l10n.padLaunchesTotal,
                      value: pad.totalLaunchCount.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

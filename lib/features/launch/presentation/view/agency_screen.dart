import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/domain/agency_model.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/agency/agency_cubit.dart';
import 'package:space_launches/features/launch/presentation/bloc/agency/agency_state.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/card_surface.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/fact_row.dart';
import 'package:space_launches/l10n/app_localizations.dart';

class AgencyScreen extends StatelessWidget {
  const AgencyScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AgencyCubit(context.read<ILaunchRepository>())..load(id),
      child: AppScaffold(
        body: BlocBuilder<AgencyCubit, AgencyState>(
          builder: (context, state) => switch (state) {
            AgencyLoading() => const Center(child: CircularProgressIndicator()),
            AgencyNotFound(:final id) => Center(
              child: Text(
                AppLocalizations.of(context).detailNotFound(id.toString()),
              ),
            ),
            AgencyLoaded(:final agency) => _AgencyContent(agency: agency),
          },
        ),
      ),
    );
  }
}

class _AgencyContent extends StatelessWidget {
  const _AgencyContent({required this.agency});

  final AgencyModel agency;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final foundingYear = agency.foundingYear;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                agency.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              CardSurface(
                child: Column(
                  spacing: 8,
                  children: [
                    FactRow(label: l10n.agencyType, value: agency.type),
                    FactRow(
                      label: l10n.agencyCountry,
                      value: agency.countryCode,
                    ),
                    if (foundingYear != null)
                      FactRow(
                        label: l10n.agencyFounded,
                        value: foundingYear.toString(),
                      ),
                    FactRow(
                      label: l10n.agencyLaunchesTotal,
                      value: agency.totalLaunchCount.toString(),
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
